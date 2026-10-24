class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.59.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.59.0/cuenv-darwin-arm64"
      sha256 "df53dd0dfa8f7cdffb4858971ef5b7f7dcaf727eb30808314108380406e13d04"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.59.0/cuenv-linux-x64"
      sha256 "aa567246522da88559b7b16af73de852ce40fe939c222a21f2d3289b940a44b2"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.59.0/cuenv-linux-arm64"
      sha256 "94f429693e537127270c4ba859b979d763f4e3a894e5799835b7b7000b6d595f"
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