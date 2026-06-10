class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.53.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.2/cuenv-darwin-arm64"
      sha256 "e4f8c5ba1ceee7e5ae171ff59052030ef8c50c1fb5092c18ca94664162199298"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.2/cuenv-linux-x64"
      sha256 "344cb314688b1f954541ca9b3f14b9cc202dd12866b65a6aff4532942ece2a84"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.2/cuenv-linux-arm64"
      sha256 "7d125b92cf0c3e121767a942789722b18909555aaa7c15f832f5f6606485ed59"
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