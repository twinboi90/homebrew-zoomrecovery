class Zoomrecovery < Formula
  desc "Fix Zoom Error 1132 on macOS"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.1..tar.gz"
  sha256 "3d6b3e4f418e4f395672e3236fd6ee84ca7c12eeb8dfab3bad634160e9f30b44"
  license "MIT"
  version "1.1.1"

  depends_on "spoof-mac""

  def install
    inreplace zoomrecovery, "VERSION_PLACEHOLDER", version.to_s
    bin.install zoomrecovery
  end
end

