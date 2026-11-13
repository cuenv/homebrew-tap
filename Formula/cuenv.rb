class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.74.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.74.0/cuenv-darwin-arm64"
      sha256 "3c2402f031b13c24ce75b8990decf2c498c067463699d801af047e3ae7f04dc7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.74.0/cuenv-linux-x64"
      sha256 "35b1b64475d70606bad0e8c2dd0657478200d503294f1ff04db97bdf220c1f0f"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.74.0/cuenv-linux-arm64"
      sha256 "1ebf6c56590dcd980ed3dfe59c70f026cc3111cfc631171622729c068af9f769"
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