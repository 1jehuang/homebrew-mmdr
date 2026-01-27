class Mmdr < Formula
  desc "Fast Mermaid diagram renderer in pure Rust (500-1000x faster than mermaid-cli)"
  homepage "https://github.com/1jehuang/mermaid-rs-renderer"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.1.2/mmdr-x86_64-apple-darwin.tar.gz"
      sha256 "8fa3f277b8e5f8551e234d92785df52b6afce5453ffae98d65d40b087f3a8dc1"
    end
    on_arm do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.1.2/mmdr-aarch64-apple-darwin.tar.gz"
      sha256 "5bbe45f5f197adfc9911703644a8e2d70548abe27bbf29b1ef94218038346f88"
    end
  end

  on_linux do
    url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.1.2/mmdr-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d0a4d8fed5438dcdda1c72d3612e2dab838c6afa6da4c7586d255e57ec5363dc"
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
