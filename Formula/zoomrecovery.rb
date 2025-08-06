class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/dbrowder23/ZoomRecovery"
  url "https://github.com/dbrowder23/ZoomRecovery/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e91f4f31d7ca2cd4c510e840fb3ead93e4cc23b759c3209005d8ceffecde7bc8"
  license "MIT"

  depends_on "spoof-mac"

  def install
    bin.install "zoomrecovery"
  end
end
