class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.17.tar.gz"
  sha256 "b7522e91a82c33a66ac2c19e32599fb5b2c1b6b3f9b7bf3ff4c8d3db7c5126b6"
  version "1.0.17"

  def install
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s
    chmod 0755, "zoomrecovery"
    bin.install "zoomrecovery"
  end

  test do
    assert_match "zoomrecovery #{version}", shell_output("#{bin}/zoomrecovery --version")
  end
end
