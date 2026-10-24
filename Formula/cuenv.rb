class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.60.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.60.1/cuenv-darwin-arm64"
      sha256 "ab78fea26437079f09ded161d4065fb052d6d516115437d5ee6719d70830db26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.60.1/cuenv-linux-x64"
      sha256 "87e5d975b23871acd319a9fcc2638a9a321a90d633280de8342f2d5a7772cb49"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.60.1/cuenv-linux-arm64"
      sha256 "6ff293fd52b3b21b744b93e0b571d33214e0c795f22db2bc09655e3499998298"
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