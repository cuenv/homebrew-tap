class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.69.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.69.0/cuenv-darwin-arm64"
      sha256 "38d1cb60b5e3f4727ff04ffc244b012992dfd6e4f3ae34e999dc6e7093d6a5fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.69.0/cuenv-linux-x64"
      sha256 "bb7745d55b9cd9655d832f0c15ae3f773c620ec26d768d504f636c8e40560466"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.69.0/cuenv-linux-arm64"
      sha256 "269b52ebcd0f3cb013ae2b0f31711fe984694ca20171ed7ad418a54c6f721b6b"
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