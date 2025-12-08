class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  url "https://github.com/cuenv/cuenv/archive/refs/tags/0.11.3.tar.gz"
  sha256 "d1a86beac6692042c6220af4c570bbf03c585fe975fd12237b4be76f8641b837"
  license "AGPL-3.0-or-later"
  head "https://github.com/cuenv/cuenv.git", branch: "main"

  depends_on "rust" => :build
  depends_on "go" => :build

  def install
    # Build the cuenv-cli binary
    system "cargo", "build", "--release", "--workspace"

    # Install the binary
    bin.install "target/release/cuenv"
  end

  test do
    # Test that the binary exists and runs
    assert_match "cuenv", shell_output("#{bin}/cuenv --version")

    # Create a minimal CUE file to test environment variable printing
    (testpath/"env.cue").write <<~EOS
      package cuenv

      env: {
        FOO: "bar"
        BAZ: "qux"
      }
    EOS

    # Run cuenv env print and check output
    output = shell_output("#{bin}/cuenv env print --path #{testpath}")
    assert_match "FOO=bar", output
    assert_match "BAZ=qux", output
  end
end
