class Mmdr < Formula
  desc "Fast Mermaid diagram renderer in pure Rust - 23 diagram types, 100-1400x faster than mermaid-cli"
  homepage "https://github.com/1jehuang/mermaid-rs-renderer"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.2/mmdr-x86_64-apple-darwin.tar.gz"
      sha256 "26958ce76d69f6597adbcdb7e008a134de014a96029f2f59959f498e24ef5430"
    end
    on_arm do
      url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.2/mmdr-aarch64-apple-darwin.tar.gz"
      sha256 "a22412f64066e1bdd8aff9570e3ce739991bb82cd6b5a2d960c648bce6aabe36"
    end
  end

  on_linux do
    url "https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v0.2.2/mmdr-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aa5e2c5f39464e252efa6c654937348bf857003414e4fbf8229b5ac41dce23f7"
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
