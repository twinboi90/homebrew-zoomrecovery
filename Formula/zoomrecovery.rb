class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.9.tar.gz"
  sha256 "09bcc779a4c2b9e3765cda78a9942d319542f969386dae335d7e5f57e8331a54"
  license "MIT"

  depends_on "spoof-mac"

  def install
    # Replace version placeholder in the script
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s

    # Install the script as an executable
    bin.install "zoomrecovery"
  end
end
