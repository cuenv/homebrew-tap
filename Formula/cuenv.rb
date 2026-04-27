class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.41.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.1/cuenv-darwin-arm64"
      sha256 "0bc3dfc2f51141d9767341ba8b6c5c998319aee401468603eb55e335dd53a5a2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.1/cuenv-linux-x64"
      sha256 "1bdcea6505d4ededee6fd416e7b5dc071e93db6fc91baaaf680e92f175743312"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.1/cuenv-linux-arm64"
      sha256 "6d56a2864434509270e59b931d97b77b416e5161d60f0928bdf14c25f54b897e"
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