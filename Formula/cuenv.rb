class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.53.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.1/cuenv-darwin-arm64"
      sha256 "3513c5c3f9250c388590d071aedb59d5e7036ebb6fd20cae6a16f5a3ab3f46c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.1/cuenv-linux-x64"
      sha256 "57a7d4728930f63e2781c821351dc78df1896accb134ef2f64c27580d05459fc"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.1/cuenv-linux-arm64"
      sha256 "cd72600080c5e4702e34b18de928ea617169954f1d870c48b9576e6d51b87289"
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