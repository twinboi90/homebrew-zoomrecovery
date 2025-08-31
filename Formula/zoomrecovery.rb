class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.9.tar.gz"
  sha256 "dadc63a207af41a22009b76605115e93351e7dfd57072f21bd63fb7de890812dx"
  license "MIT"

  depends_on "spoof-mac"

  def install
    # Replace version placeholder in the script
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s

    # Install the script as an executable
    bin.install "zoomrecovery"
  end
end
