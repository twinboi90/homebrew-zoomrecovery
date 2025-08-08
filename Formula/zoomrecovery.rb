class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/dbrowder23/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/null.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  depends_on "spoof-mac"

  def install
    bin.install "zoomrecovery"
  end
end
