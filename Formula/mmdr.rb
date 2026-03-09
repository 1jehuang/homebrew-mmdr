class Mmdr < Formula
  desc "Fast Mermaid diagram renderer in pure Rust - 23 diagram types, 100-1400x faster than mermaid-cli"
  homepage "https://github.com/1jehuang/mermaid-rs-renderer"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.1/mmdr-x86_64-apple-darwin.tar.gz"
      sha256 "1e06ebdf401e00c8be509f6bf3ce6964c6592b8bef6b2b06c7fd4b491468ddb1"
    end
    on_arm do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.1/mmdr-aarch64-apple-darwin.tar.gz"
      sha256 "f10fd28395c1705f742994d63c1b193dc212e5f5d72f11b03e6cc4c50e46163c"
    end
  end

  on_linux do
    url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.1/mmdr-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "84ce1c77f0969a9665b355656048216fe1b2d712f44ae168a83f6d9acb260292"
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
