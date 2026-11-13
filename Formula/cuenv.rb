class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.75.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.75.1/cuenv-darwin-arm64"
      sha256 "93adf0fceec6fa73aa2ca6071685a7f8178a9a3e7a9ce491dbd07dcf3a94d103"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.75.1/cuenv-linux-x64"
      sha256 "aec65f112b05dc8f91090cc570de4d39c649e9554ef28b3ca6f758141191673a"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.75.1/cuenv-linux-arm64"
      sha256 "29ebb073ef4e4941d568ef84a83c0f2fd8b452460e8b825ee42e0539ebfa7529"
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