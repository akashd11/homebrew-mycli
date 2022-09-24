# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Toolkit < Formula
  include Language::Python::Virtualenv
  desc "testing cli"
  homepage "https://github.com/akashd11/toolkit"
  url "https://github.com/akashd11/toolkit/archive/refs/tags/v1.3.tar.gz"
  sha256 "f2388545d9050e417f3da514032b83fe9ea6f30921d097fcdc48dbd2ec4aa6b7"

  livecheck do
    url :stable
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "708a02986b8541ace4d206cb755d94044a2e1b1249de74832c552893fef6ec24" => :catalina
    sha256 "58059c69cd889bb677f6549d5a48052a59eaf714e286b80ae9ce8dfe2ab93a8a" => :mojave
    sha256 "357a8b2b3bdf9efdb62e337317fe141f87138e8dd4aea923129c6cdc912e19dc" => :high_sierra
  end

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
