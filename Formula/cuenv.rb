class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.60.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.60.0/cuenv-darwin-arm64"
      sha256 "910afbec0a552a60d419962437e74fb7cab854da12f7dd426ecf2726c513ae1c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.60.0/cuenv-linux-x64"
      sha256 "433122e4aa78f2d91d9bd86e10c1d0308cb83f49436ff3c4f58582c451ffe036"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.60.0/cuenv-linux-arm64"
      sha256 "ce3e943d99d650109c62c35d882246981f9425411824246caa342a33f210390b"
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