class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  url "https://github.com/cuenv/cuenv/archive/refs/tags/0.15.2.tar.gz"
  sha256 "fd20b9eae8569d2fc981f5cc37301966ae2a1c6a0389c029e61decf525174677"
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
