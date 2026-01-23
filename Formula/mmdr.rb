class Mmdr < Formula
  desc "Fast Mermaid renderer in Rust (flowchart/class/state/sequence)"
  homepage "https://github.com/1jehuang/mermaid-rs-renderer"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.1.0/mmdr-x86_64-apple-darwin.tar.gz"
    sha256 "270db0c8a1a70990351720147bc9e7baeb3c22dcf3da172d507dafb2f519e964"
  end

  on_linux do
    url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.1.0/mmdr-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efcf55baaddf80af8242e92807388acd0c828ebdd5f572487741e0a8b0793e61"
  end

  def install
    bin.install "mmdr"
  end

  test do
    input = "flowchart LR\nA-->B\n"
    system bin/"mmdr", "-e", "svg", "-i", "-", "-o", "out.svg", :input => input
    assert_predicate testpath/"out.svg", :exist?
  end
end
