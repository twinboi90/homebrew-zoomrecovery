class Zoomrecovery < Formula
  desc "Reset Zoom state and spoof network identity for Zoom"
  homepage "https://github.com/twinboi90/ZoomRecovery"
  url "https://github.com/twinboi90/ZoomRecovery/archive/refs/tags/v1.0.13.tar.gz"
  sha256 "1429c64baaa002976c2db4475593f69db69ad10635e375bf90874d915d586f89"
  version "1.0.13"
  
  depends_on "spoof-mac"

inreplace "zoomrecovery" do |s|
  replaced = false
  [
    /BAKED_VERSION\s*=\s*["'].*?["']/,
    /BAKED_VERSION\s*=\s*[0-9]+\.[0-9]+(?:\.[0-9]+)?/,
    /BAKED_VERSION\s*:\s*["'].*?["']/,
    /BAKED_VERSION\s*[:=]\s*["']?.*?["']?/
  ].each do |rx|
    if s.sub!(rx, "BAKED_VERSION=\"#{version}\"")
      replaced = true
      break
    end
  end
  s.prepend("BAKED_VERSION=\"#{version}\"\n") unless replaced
end