class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.41.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.3/cuenv-darwin-arm64"
      sha256 "48c5eda79e1816ab1e13caa1d5422b870284d82b9bed9b92fbdbc54789b01f67"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.3/cuenv-linux-x64"
      sha256 "b9b89b2ab41481a927579bbd613400f049b48f4651d3355fd04719ced3696924"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.3/cuenv-linux-arm64"
      sha256 "673e4e6a6985cee4d67738e998fe9b0941890cfd567694bc5e1098b488496c89"
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