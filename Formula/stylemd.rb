class Stylemd < Formula
  desc "Markdown styling toolkit — lint, format, fix, and polish your prose"
  homepage "https://github.com/leaf-kit/style.md"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/leaf-kit/style.md/releases/download/v0.1.0/stylemd-x86_64-apple-darwin.tar.gz"
    sha256 "66c0a3265749c2a42ab4e2bb86f6df9d3b8fee334b9d465268e6afb3f2558153"
  end

  def install
    bin.install "stylemd"
  end

  test do
    assert_match "stylemd #{version}", shell_output("#{bin}/stylemd --version")

    (testpath/"test.md").write("# Title\ntext   \n")
    output = shell_output("#{bin}/stylemd check #{testpath}/test.md 2>&1")
    assert_match "trailing", output.downcase

    system bin/"stylemd", "init"
    assert_predicate testpath/".stylemd.toml", :exist?
  end
end
