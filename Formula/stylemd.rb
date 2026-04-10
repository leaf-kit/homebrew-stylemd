class Stylemd < Formula
  desc "The all-in-one Markdown toolkit — lint, format, fix, and analyze"
  homepage "https://github.com/leaf-kit/style.md"
  url "https://github.com/leaf-kit/style.md/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ac1581e95a058b8b380ddca23e32841e4e0fc0d989c850a414817714145c6196"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath / "test.md").write("# Hello\n\nWorld\n")
    system bin / "stylemd", "check", "test.md"
  end
end
