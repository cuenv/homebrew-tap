class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.72.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.72.0/cuenv-darwin-arm64"
      sha256 "7b0fb2c2765983f3e2c9a731b3ea83c1ee03012cd5191aa2008610b5cd553e65"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.72.0/cuenv-linux-x64"
      sha256 "b79f9b3a9704a2e85cde9ce7ef83824f8a7bce13a1133516e770cba71c27beca"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.72.0/cuenv-linux-arm64"
      sha256 "8c7431c37700c96ef55116086978c281544bf93f1d996ab61409d829e52da208"
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