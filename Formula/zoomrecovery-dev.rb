class ZoomrecoveryDev < Formula
  desc "Fix Zoom Error 1132 (Device Identification Conflict) - Development Version"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.2.0-dev.1.tar.gz"
  sha256 "bd40a4f8ba2ddc9387cf3fc2e5311ebf9bf5b5dea02485dd63c8879d3654826b"
  version "1.2.0-dev.1"
  license "MIT"

  depends_on "openssl"

  def install
    bin.install "zoomrecovery" => "zoomrecovery-dev"
  end

  def post_install
    puts "\n⚠️  Development Version Installed"
    puts "This is a pre-release version for testing Zoom 7.0.0 compatibility."
    puts "\nUsage: sudo zoomrecovery-dev"
    puts "\nTo report issues or provide feedback:"
    puts "  https://github.com/twinboi90/ZoomRecovery/issues\n\n"
  end

  test do
    system "#{bin}/zoomrecovery-dev", "--version"
  end
end
