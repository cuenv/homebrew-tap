class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.42.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.42.0/cuenv-darwin-arm64"
      sha256 "c5c8a2a33c570ffb452d4d1586de0360e8b87410b7dc1245a381e7e3d29c7bd1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.42.0/cuenv-linux-x64"
      sha256 "968ff47c85f2c6473686835d8eb33a038fe0138c9428ad647d0e2fda1261fe6a"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.42.0/cuenv-linux-arm64"
      sha256 "e3e6e01881125481b7b3493eb8d6f7bae69d35617e9acfd6b89157c2d3aee5ce"
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