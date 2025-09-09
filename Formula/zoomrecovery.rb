class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "b94e6bba6796fc0a387ffa9ab864b1c52a6b6783b09c8b4ef4f570bd64ef201a"
  version "1.1.2"

  def install
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s
    chmod 0755, "zoomrecovery"
    bin.install "zoomrecovery"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zoomrecovery --version")
  end
end
