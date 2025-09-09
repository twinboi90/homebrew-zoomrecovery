class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "3d6b3e4f418e4f395672e3236fd6ee84ca7c12eeb8dfab3bad634160e9f30b44
  version "1.1.1"

  def install
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s
    chmod 0755, "zoomrecovery"
    bin.install "zoomrecovery"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zoomrecovery --version")
  end
end
