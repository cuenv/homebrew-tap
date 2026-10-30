class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.63.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.63.2/cuenv-darwin-arm64"
      sha256 "8ffe172f09390308b90378f64723b07a2689761351c37affec308aa656e0aaba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.63.2/cuenv-linux-x64"
      sha256 "5f9a363851b6031972c09e55e177753a7474de073d98ede5ecf2a2a4133197fa"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.63.2/cuenv-linux-arm64"
      sha256 "0c6dd349b14a11d3740b07aecef566150ddc808dd95fdcc127feaa58df605519"
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