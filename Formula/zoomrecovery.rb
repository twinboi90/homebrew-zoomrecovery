class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.9.tar.gz"
  sha256 "a48ef0e18ea92d372bd37b146007d16b8766369d6309a97b83202bf81f178084"
  license "MIT"

  depends_on "spoof-mac"

  def install
    # Replace version placeholder in the script
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s

    # Install the script as an executable
    bin.install "zoomrecovery"
  end
end
