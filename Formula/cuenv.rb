class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.76.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.76.0/cuenv-darwin-arm64"
      sha256 "6e7dd5b4bf9f934070724fe4f766f6279547d2aa6b7909d0e1c0caae2342eb9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.76.0/cuenv-linux-x64"
      sha256 "ba8f18e7dcd39102b6a0a64814079ca2ceb3388748caf65f7a91ce4d3877b005"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.76.0/cuenv-linux-arm64"
      sha256 "a416e53e586a3c8647676c8e1c97f955084bf1e89df8a5f89c150842538e5cc8"
    end
  end

  def install
    binary = if OS.mac? && Hardware::CPU.arm?
      "cuenv-darwin-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      "cuenv-linux-x64"
    elsif OS.linux? && Hardware::CPU.arm?
      "cuenv-linux-arm64"
    else
      odie "Unsupported platform"
    end
    bin.install binary => "cuenv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cuenv --version")
  end
end