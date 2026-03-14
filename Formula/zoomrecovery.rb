class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.19.tar.gz"
  sha256 "0e39974418609a262e07140e96493822a20fe44c088ba9ec19fb61049aa013f4"
  version "1.0.19"

  def install
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s
    chmod 0755, "zoomrecovery"
    bin.install "zoomrecovery"
  end

  test do
    assert_match "zoomrecovery #{version}", shell_output("#{bin}/zoomrecovery --version")
  end
end
