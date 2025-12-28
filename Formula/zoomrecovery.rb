class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.13.tar.gz"
  sha256 "1429c64baaa002976c2db4475593f69db69ad10635e375bf90874d915d586f89"
  version "1.0.13"
  
  depends_on "spoof-mac"

def install
  # Replace any existing BAKED_VERSION="..." line (placeholder or baked value)
  # with the formula version string. Robust against both placeholder and
  # baked-version tarballs and avoids passing a Version object to inreplace.
  inreplace "zoomrecovery" do |s|
    s.gsub!(/VERSION_PLACEHOLDER/, version.to_s)
    s.gsub!(/BAKED_VERSION=["'].*?["']/, "BAKED_VERSION=\"#{version}\"")
  end

  chmod 0755, "zoomrecovery"
  bin.install "zoomrecovery"
end

  test do
    out = shell_output("#{bin}/zoomrecovery --version")
    assert_match version.to_s, out
  end
end
