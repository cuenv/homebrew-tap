class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.56.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.1/cuenv-darwin-arm64"
      sha256 "4cfc324e44ecf64e17c36a5d9d2d524fc1644d6fd7374ff9ac6c6711bc4545fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.1/cuenv-linux-x64"
      sha256 "afb1d712a2a405f25804b60c30c418144c195dc157f70bb9aa5b73c95dd461bf"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.1/cuenv-linux-arm64"
      sha256 "f24eb748e01ff67d4888c442e455357fda200e84cb53bcbf87bbf4bafe7a2a58"
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