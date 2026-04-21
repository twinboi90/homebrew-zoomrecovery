class Pyversion < Formula
  include Language::Python::Virtualenv

  desc "Automatic Python version and virtualenv manager — one command that just works"
  homepage "https://github.com/twinboi90/pyversion"
  url "https://github.com/twinboi90/pyversion/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7b7e7ab9d293282cb97be4ba192baa8a6edda67a63c3caf78b50d6ded3615716"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "pyversion #{version}", shell_output("#{bin}/pyversion --version")
  end
end
