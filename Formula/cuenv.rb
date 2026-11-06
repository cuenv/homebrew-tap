class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.70.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.0/cuenv-darwin-arm64"
      sha256 "a8b3fba33b7b9098f6e7ce2c31090f8e287a2f1e22c9f440f3393b689e20c829"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.0/cuenv-linux-x64"
      sha256 "3e6695d046843a53a1095c69e1b8153be43a2ac2293d60ec3e29e21a3cf9445b"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.0/cuenv-linux-arm64"
      sha256 "95e5fc988584e1358cce56761f5fbee484d1fd8ab580eb5435bf09613c7f5e18"
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