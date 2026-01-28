class Mmdr < Formula
  desc "Fast Mermaid diagram renderer in pure Rust (500-1000x faster than mermaid-cli)"
  homepage "https://github.com/1jehuang/mermaid-rs-renderer"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.1.2/mmdr-x86_64-apple-darwin.tar.gz"
      sha256 "ffd7f08a21575d3537b8356126f535fc3ba68b78c62c355af2cf6f13c2fea198"
    end
    on_arm do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.1.2/mmdr-aarch64-apple-darwin.tar.gz"
      sha256 "8a5f325967feb00e29a4032c4932c07a5cf0bd02af02856818117eb6c0f3e2f6"
    end
  end

  on_linux do
    url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.1.2/mmdr-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d38ce8822ee9a158d0c1266e9197996528bf68549bbe2cd18d59765f74547004"
  end

  def install
    bin.install "mmdr"
  end

  test do
    input = "flowchart LR\nA-->B\n"
    pipe_output("#{bin}/mmdr -e svg -o test.svg", input)
    assert_predicate testpath/"test.svg", :exist?
  end
end
