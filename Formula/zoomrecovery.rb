class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.11.tar.gz"
  sha256 "df06d55e36d36a1d6b3d079891e16925e33f909672311d4ae541175a1c8bebb6"
  version "1.0.11"
  
  depends_on "spoof-mac"

def install
  # Replace any existing BAKED_VERSION="..." line (placeholder or baked value)
  # with the formula version string. Robust against both placeholder and
  # baked-version tarballs and avoids passing a Version object to inreplace.
  inreplace "zoomrecovery" do |s|
    s.gsub!(/BAKED_VERSION=".*?"/, "BAKED_VERSION=\"#{version.to_s}\"")
  end

  chmod 0755, "zoomrecovery"
  bin.install "zoomrecovery"
end

  test do
    out = shell_output("#{bin}/zoomrecovery --version")
    assert_match version.to_s, out
  end
end
