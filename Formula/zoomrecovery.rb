class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.15.tar.gz"
  sha256 "0bcbbdcf0191748cfd0360adb9b6f5270d3cf44a7f2970920ec0d573586581e2"
  version "1.0.15"

  def install
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s
    chmod 0755, "zoomrecovery"
    bin.install "zoomrecovery"
  end

  test do
    assert_match "zoomrecovery #{version}", shell_output("#{bin}/zoomrecovery --version")
  end
end
