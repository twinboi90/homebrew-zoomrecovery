class Zoomrecovery < Formula
  desc "Fix Zoom error 1132 by clearing corrupted database files"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/releases/download/v1.0.22/zoomrecovery"
  sha256 "0f4615c2447664cb10bc62f9f0a8ab94d0ca5fb00915c05159dff5266c2d2b2b"
  license "MIT"
  depends_on :macos

  def install
    bin.install "zoomrecovery"
  end

  test do
    assert_match "zoomrecovery", shell_output("#{bin}/zoomrecovery --version")
  end
end
