# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Toolkit < Formula
  include Language::Python::Virtualenv
  desc "testing cli"
  homepage "https://github.com/akashd11/toolkit"
  url "https://github.com/akashd11/toolkit/archive/refs/tags/v1.2.tar.gz"
  sha256 "1dc834578c58244638e09b4562f8a506027f4d6bf2d61152d4f8b8a9cb521a85"

  depends_on "python@3.10"

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "click-default-group" do
    url "https://files.pythonhosted.org/packages/22/3a/e9feb3435bd4b002d183fcb9ee08fb369a7e570831ab1407bc73f079948f/click-default-group-1.2.2.tar.gz"
    sha256 "d9560e8e8dfa44b3562fbc9425042a0fd6d21956fcc2db0077f63f34253ab904"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "15", shell_output("#{bin}/toolkit --get '/:memory:.csv?sql=select+3*5'")
    assert_match "<title>toolkit:", shell_output("#{bin}/toolkit --get '/'")
  end
end
