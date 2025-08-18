class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "15df65371372d9c701654f110570eb403ebe0481f5aa8152ffb46c4062e8e347"
  license "MIT"

  depends_on "spoof-mac"

  def install
    bin.install "zoomrecovery"
  end
end
