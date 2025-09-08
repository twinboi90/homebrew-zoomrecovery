class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "aaf07bba6c8b152c072e5116cbebf5f513a366dbe73fbb8acb2b5dc71b675cc5"
  version "1.1.0"
  license "MIT"
  
  depends_on "spoof-mac"

  def install
    bin.install "zoomrecovery"
  end
end
