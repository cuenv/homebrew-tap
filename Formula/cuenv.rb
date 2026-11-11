class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.73.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.73.0/cuenv-darwin-arm64"
      sha256 "4c03efa5deee93c7c7775986837471c02aee490b3f5e6ee93288691fb0f15f1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.73.0/cuenv-linux-x64"
      sha256 "eeeb90581e59e4f033eaefb2b6dbcba4d9e69cd06a4caae0bf94436c36661243"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.73.0/cuenv-linux-arm64"
      sha256 "d7245219f9f2987c504add754caa7e0a8d3a8306fdcd6916bd5b41e4a3c6cf1f"
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