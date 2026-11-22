class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.77.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.77.0/cuenv-darwin-arm64"
      sha256 "bdb3413abdea0c5617ed5a9ec3c10c5813dd6a3b8233305e81c53d76d5236647"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.77.0/cuenv-linux-x64"
      sha256 "d7a35a14778316c65ff725bd3c1bd776ea1610b09f02cc20badc588110899085"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.77.0/cuenv-linux-arm64"
      sha256 "fde68bff3e2adc383d25bc64530b0c72b53fab32181da97af99dbed52e7a6814"
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