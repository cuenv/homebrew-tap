class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.65.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.65.0/cuenv-darwin-arm64"
      sha256 "ed5e0db8947eb82858508f533fb9f4eb370ae7c6f247e2f4712756425627d35f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.65.0/cuenv-linux-x64"
      sha256 "eb508f27e8f6824e73d6c2b9c507e641a779b4ecd40b6362ea02210668d70d43"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.65.0/cuenv-linux-arm64"
      sha256 "d8a037aa1a1a6071a16ae6f6ab69c511b8b5279f472fe2df6854d634c66f5ab4"
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