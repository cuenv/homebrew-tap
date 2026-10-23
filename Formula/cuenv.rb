class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.58.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.58.0/cuenv-darwin-arm64"
      sha256 "9918951338a92405dd7b0bee57d3283ec09d07c43c9cccbdc732bae1f59ae775"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.58.0/cuenv-linux-x64"
      sha256 "eb00d893442185b7e48b408d591be2f55fa20eb50231c7cebb8b2cbd289927ec"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.58.0/cuenv-linux-arm64"
      sha256 "8a4f2942f2e152c1fb90dff279110fbd661eab20499a8af93df192c03c0947fc"
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