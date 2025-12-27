const core = require('@actions/core');
const exec = require('@actions/exec');
const fs = require('fs');
const path = require('path');

function writeEnv(name, value) {
  const envFile = process.env.GITHUB_ENV;
  if (!envFile) {
    core.warning('GITHUB_ENV not present; cannot persist env variables for subsequent steps');
    return;
  }
  fs.appendFileSync(envFile, `${name}=${value}\n`);
}

async function cmdExists(cmd) {
  try {
    await exec.exec(cmd, ['--version'], {silent: true});
    return true;
  } catch {
    return false;
  }
}

async function getCommandOutput(cmd, args = []) {
  let output = '';
  await exec.exec(cmd, args, {
    listeners: {
      stdout: (data) => { output += data.toString(); },
      stderr: (data) => { /* ignore stderr for prefix checks */ }
    }
  });
  return output.trim();
}

async function execWithRetry(cmd, args = [], options = {}, retries = 2) {
  let attempt = 0;
  while (true) {
    try {
      await exec.exec(cmd, args, options);
      return;
    } catch (err) {
      attempt++;
      if (attempt > retries) throw err;
      core.warning(`Command failed (attempt ${attempt}/${retries}). Retrying: ${cmd} ${args.join(' ')}`);
      await new Promise(r => setTimeout(r, 1500 * attempt));
    }
  }
}

function tryPrependPaths(paths) {
  for (const p of paths) {
    const brewExe = path.join(p, 'bin', 'brew');
    if (fs.existsSync(brewExe)) {
      process.env.PATH = `${path.join(p, 'bin')}:${process.env.PATH}`;
      core.info(`Prepended ${path.join(p, 'bin')} to PATH`);
      return true;
    }
  }
  return false;
}

async function run() {
  try {
    const tap = core.getInput('tap') || 'twinboi90/zoomrecovery';
    const pkg = core.getInput('package') || 'zoomrecovery';

    core.info(`Tap: ${tap}`);
    core.info(`Package: ${pkg}`);

    // If brew is not in PATH, try common prefixes
    if (!(await cmdExists('brew'))) {
      core.info('brew not found in PATH — probing common homebrew prefixes');
      tryPrependPaths(['/opt/homebrew', '/usr/local', '/home/linuxbrew/.linuxbrew', '/home/linuxbrew/.linuxbrew/bin']);
    }

    const hasBrew = await cmdExists('brew');
    if (!hasBrew) {
      core.info('Homebrew not found. Installing Homebrew (NONINTERACTIVE=1).');
      const installCmd = 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"';
      const env = Object.assign({}, process.env, { NONINTERACTIVE: '1' });
      await exec.exec(installCmd, [], { env });
      core.info('Attempted Homebrew install.');
      // try again to pick up brew
      tryPrependPaths(['/opt/homebrew', '/usr/local', '/home/linuxbrew/.linuxbrew']);
    } else {
      core.info('Homebrew present.');
    }

    // Determine brew prefix if possible
    let brewPrefix = '';
    try {
      brewPrefix = await getCommandOutput('brew', ['--prefix']);
      if (!brewPrefix) {
        // fallback guesses
        const fallbacks = ['/home/linuxbrew/.linuxbrew', '/opt/homebrew', '/usr/local'];
        for (const f of fallbacks) {
          if (fs.existsSync(f)) {
            brewPrefix = f;
            break;
          }
        }
      }
      core.info(`brew prefix: ${brewPrefix || '(unknown)'}`);
    } catch (e) {
      core.warning('Unable to determine brew prefix; continuing but PATH fixups may be skipped.');
    }

    // Ensure brew binary available in PATH
    if (!await cmdExists('brew')) {
      const possible = [];
      if (brewPrefix) possible.push(path.join(brewPrefix, 'bin'));
      possible.push('/home/linuxbrew/.linuxbrew/bin', '/opt/homebrew/bin', '/usr/local/bin');
      tryPrependPaths(possible);
    }

    // Tap the custom tap (idempotent)
    core.info(`Tapping ${tap}`);
    try {
      await execWithRetry('brew', ['tap', tap], { env: Object.assign({}, process.env, { NONINTERACTIVE: '1' }) }, 2);
      core.info(`Tapped ${tap}`);
    } catch (e) {
      core.warning(`brew tap ${tap} returned an error (it may already be tapped): ${e && e.message}`);
    }

    // Install the formula (idempotent; retry on transient failures)
    core.info(`Installing formula ${pkg}`);
    await execWithRetry('brew', ['install', pkg], { env: Object.assign({}, process.env, { NONINTERACTIVE: '1' }) }, 2);

    // Export environment variables for subsequent steps if prefix known
    if (brewPrefix) {
      const optDir = path.join(brewPrefix, 'opt', pkg);
      const binPath = path.join(optDir, 'bin');
      const libPath = path.join(optDir, 'lib');
      const includePath = path.join(optDir, 'include');
      const pkgconfig = path.join(libPath, 'pkgconfig');

      // Persist variables to GITHUB_ENV
      writeEnv('PATH', `${binPath}:$PATH`);
      writeEnv('LDFLAGS', `-L${libPath}`);
      writeEnv('CPPFLAGS', `-I${includePath}`);
      writeEnv('PKG_CONFIG_PATH', `${pkgconfig}`);

      core.setOutput('brew_prefix', brewPrefix);
      core.setOutput('package_prefix', optDir);

      core.info(`Exported PATH (prepended ${binPath}), LDFLAGS, CPPFLAGS, PKG_CONFIG_PATH`);
    } else {
      core.info('brew prefix unknown; skipping environment exports.');
    }

    core.info('zoomrecovery install step complete');
  } catch (error) {
    core.setFailed(error && error.message ? error.message : String(error));
  }
}

run();