class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.75.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.75.0/cuenv-darwin-arm64"
      sha256 "bfde0586600d319a819c0949baed5b456334ad91364aeedcc4a28e11bb373956"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.75.0/cuenv-linux-x64"
      sha256 "c02ff56fe0f469c8738491d16649ef7c91f123b73a01553a598500bf2376e944"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.75.0/cuenv-linux-arm64"
      sha256 "7bcbe16ca047a50b40ada73435ad7a2401200bd586a29f9753dc745ac6cbc5b9"
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