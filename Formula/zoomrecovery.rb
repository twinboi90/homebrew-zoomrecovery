class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.16.tar.gz"
  sha256 "7fcc9fce2aebb6b4b0ee92667486c3046779060c28b4619a5825bcb5a3ed26c8"
  version "1.0.16"

  def install
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s
    chmod 0755, "zoomrecovery"
    bin.install "zoomrecovery"
  end

  test do
    assert_match "zoomrecovery #{version}", shell_output("#{bin}/zoomrecovery --version")
  end
end
