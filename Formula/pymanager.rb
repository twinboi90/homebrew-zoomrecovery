class Pymanager < Formula
  include Language::Python::Virtualenv

  desc "Automatic Python version and virtualenv manager — one command that just works"
  homepage "https://github.com/twinboi90/pymanager"
  url "https://github.com/twinboi90/pymanager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bf02e184e24b2bf64d272531c97f5e8378305a8a165f3a1af081c4f9c5cc9bbe"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "pymanager #{version}", shell_output("#{bin}/pymanager --version")
  end
end
