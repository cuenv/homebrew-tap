class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.56.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.2/cuenv-darwin-arm64"
      sha256 "a2f263069fd060c61d6a9c4a3905b79d5adafa5a44825cf475795ffe3c278c9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.2/cuenv-linux-x64"
      sha256 "b1f51d55969b62d427e36b89c9fa159a91157cdcde8e889266aac41973f42d4a"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.2/cuenv-linux-arm64"
      sha256 "514435fb651973c1a7d3f45b2f1aebe1a33593370b6f5b0fa5ed99f73d7fc8b5"
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