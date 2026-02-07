class Mmdr < Formula
  desc "Fast Mermaid diagram renderer in pure Rust (100-1400x faster than mermaid-cli)"
  homepage "https://github.com/1jehuang/mermaid-rs-renderer"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.0/mmdr-x86_64-apple-darwin.tar.gz"
      sha256 "a9d9132d96b05bc791aeacdb560e1a0d130a09b33c0c71b860be84d3556a1dfe"
    end
    on_arm do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.0/mmdr-aarch64-apple-darwin.tar.gz"
      sha256 "ea35ed6fcf4f69d47a6f6be70a0be86bd3c16880494032703f0d78496dc2e982"
    end
  end

  on_linux do
    url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.0/mmdr-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a4bdd20f95150a8953463ea6d0dd5b77df0a25d37150781ebf342e252347d2a5"
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
