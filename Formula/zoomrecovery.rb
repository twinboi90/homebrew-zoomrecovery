class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "0568f772f1c7b6c32d08cb16761c6dc5ff4747a328221e2df1ca7edbce5f8ff5"
  version "1.0.10"

  def install
    inreplace "zoomrecovery", "VERSION_PLACEHOLDER", version.to_s
    chmod 0755, "zoomrecovery"
    bin.install "zoomrecovery"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zoomrecovery --version")
  end
end
