class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.81.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.2/cuenv-darwin-arm64"
      sha256 "89105873d5defabfd0c0f90f4b1bdadaac7b3818334ffdfef2a42958c876d0e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.2/cuenv-linux-x64"
      sha256 "63366dbd762fc4d3585f6a9988effa54780ef255d0e05dd5fcdf0bbc0a64cd68"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.2/cuenv-linux-arm64"
      sha256 "f4341d6520048f1c89371af9d8d57711b3fa0b66217b823899551fa507c03ee3"
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