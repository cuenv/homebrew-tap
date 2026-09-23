class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.56.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.0/cuenv-darwin-arm64"
      sha256 "25113ed49ce1edd4277d05fbb4c79331ee67d27ac1eefc86fb9ebcda78609404"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.0/cuenv-linux-x64"
      sha256 "d0b16aa059915c57fdb0cd8ed0bdea3d287346af6348ad6ca621256b69a40523"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.0/cuenv-linux-arm64"
      sha256 "5f2817257470e1c836b4482ece653c6f784e9c6c8dd8c15ee340235f73dc694f"
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
