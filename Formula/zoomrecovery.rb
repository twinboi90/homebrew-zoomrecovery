class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.14.tar.gz"
  sha256 "ab7cdc7f55bcd47e8eb1a0c53d9febef1c7246a3e4bd54997224c420023c2caa"
  version "1.0.14"

  depends_on "spoof-mac"

  def install
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s
    chmod 0755, "zoomrecovery"
    bin.install "zoomrecovery"
  end

  test do
    assert_match "zoomrecovery #{version}", shell_output("#{bin}/zoomrecovery --version")
  end
end