class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.1.0.a.tar.gz"
  sha256 "553c8a4f553aa138a4847b39c1d055da71748b3d9fde9bdc7b63cc2caf339532"
  version "1.1.0.a"

  def install
    bin.install "zoomrecovery" 

  test do
    assert_match version, shell_output("#{bin}/zoomrecovery --version")
  end
end
end
