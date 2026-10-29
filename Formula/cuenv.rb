class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.61.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.61.0/cuenv-darwin-arm64"
      sha256 "0bd3febe95c211766e957081238ec1261cf09a0d3ff989e252661b78d8d2c729"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.61.0/cuenv-linux-x64"
      sha256 "20322ecf81cd8046122680fc0ac2cc0a2d613a2094fc4bd6866260794607d464"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.61.0/cuenv-linux-arm64"
      sha256 "ccce4de85ebf6e8608aef53378b2ae49ad75116be8ebff80cbf6660baf118160"
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