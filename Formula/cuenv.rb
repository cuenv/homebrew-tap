class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.57.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.1/cuenv-darwin-arm64"
      sha256 "64d96db1e7015a409bd967562198eb89e439848a99c7c8e0b77bb91e7fe833d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.1/cuenv-linux-x64"
      sha256 "3d16cce0f2b15237e03ff67494b2f581ed7ad7b3d45fb1c83fb44c2ec084bfe9"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.1/cuenv-linux-arm64"
      sha256 "1110a95745df188249581068c2f35d8e8028cccd9a0f0c860ee3c1da74141d62"
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