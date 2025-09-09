class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "aaf07bba6c8b152c072e5116cbebf5f513a366dbe73fbb8acb2b5dc71b675cc5"
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
