class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.52.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.52.0/cuenv-darwin-arm64"
      sha256 "034dea73eba01b198682a39d088a91a01d88c9e406d3a0b7d7bcd5c9f4134c0c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.52.0/cuenv-linux-x64"
      sha256 "6ab780c16051b74d3768cf5d6dd575399a7046059c33feebbbf2939bebeb8278"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.52.0/cuenv-linux-arm64"
      sha256 "966fc52336e5f9a97a49b53e351b88fad77db21b694f1e7a9be3fbea3c7e335a"
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