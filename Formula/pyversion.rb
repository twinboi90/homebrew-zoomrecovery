class Pyversion < Formula
  include Language::Python::Virtualenv

  desc "Automatic Python version and virtualenv manager — one command that just works"
  homepage "https://github.com/twinboi90/pyversion"
  url "https://github.com/twinboi90/pyversion/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "fb596aa020da703943d0612b3f1008a75c275f566b712aab3648e3af18c783e1"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "pyversion #{version}", shell_output("#{bin}/pyversion --version")
  end
end
