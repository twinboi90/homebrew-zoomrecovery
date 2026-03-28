class Zoomrecovery < Formula
  desc "Fix Zoom error 1132 by clearing corrupted database files"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.20.tar.gz"
  sha256 "5a20a22ff6319f8f9e362916e523a004e99e3362129ef70519273023f782646f"
  license "MIT"

  depends_on :macos

  def install
    bin.install "zoomrecovery"
  end

  test do
    assert_match "zoomrecovery", shell_output("#{bin}/zoomrecovery --version")
  end
end
