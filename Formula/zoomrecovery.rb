class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/dbrowder23/ZoomRecovery"
  url "https://github.com/dbrowder23/ZoomRecovery/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "0829e466736b7677cee8f03520eb069759939a104c7c2609c2d244eec8f50585"
  license "MIT"

  depends_on "spoof-mac"

  def install
    bin.install "zoomrecovery"
  end
end
