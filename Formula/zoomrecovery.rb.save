class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.9.tar.gz"
  sha256 "bda35c54e5167ed0b4148d8ddd439bc4c8f202cfc28b4e0ef3ddbfc496965c6a"
  license "MIT"

  depends_on "spoof-mac"

  def install
    # Replace version placeholder in the script
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s

    # Install the script as an executable
    bin.install "zoomrecovery"
  end
end
