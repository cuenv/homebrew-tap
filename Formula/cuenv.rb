class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.70.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.1/cuenv-darwin-arm64"
      sha256 "916337139d8ec3cf87c704d7bab9de7eace535088b79f3d482fa2dbe3ddc81fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.1/cuenv-linux-x64"
      sha256 "a651051f67631f4530377728074b0330bb31bede5be75160a656d664318b0717"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.1/cuenv-linux-arm64"
      sha256 "5bd818d65ac4d270c0d05fa0e0996306277ff8a92525be9ac85864928110974c"
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