class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.50.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.50.0/cuenv-darwin-arm64"
      sha256 "ae3d95d562bdc17ac7352b551b0641a1594ca79f12d37a713870a009e7d84dae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.50.0/cuenv-linux-x64"
      sha256 "8b206cab0385523ffe187d3b5dea2b56740276f645b3613b561fbfc035905ce4"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.50.0/cuenv-linux-arm64"
      sha256 "7218922563d73f83aba1ef6ce1863b4ce789b7980c1efd61615abd2ab617a594"
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