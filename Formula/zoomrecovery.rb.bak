class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "46e8a067e56a7f89a710fcc6cb141986ac549ffe315d22e3e673dc08d502b629"
  license "MIT"

  depends_on "spoof-mac"

  def install
    # Replace version placeholder in the script
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s

    # Install the script as an executable
    bin.install "zoomrecovery"
  end
end
