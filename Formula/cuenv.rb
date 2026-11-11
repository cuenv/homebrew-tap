class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.73.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.73.1/cuenv-darwin-arm64"
      sha256 "ac329bceaae27d9bd62d71fac5f20b3781dedc9a8c73af33a61863efab2f596a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.73.1/cuenv-linux-x64"
      sha256 "52ac30193de41967f5353c3cd2c7222dfff8ef52242962012d51401602cff603"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.73.1/cuenv-linux-arm64"
      sha256 "ccf08d066658c25895b8da287b4620da7013fceee84f6abe0e21ab42b6062a76"
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