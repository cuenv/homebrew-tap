class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.57.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.0/cuenv-darwin-arm64"
      sha256 "59eba0b6134ab1697c078bca72bb06e30c20ac56d687dc3a93053edba0052a2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.0/cuenv-linux-x64"
      sha256 "082450fad3dd09c0ab8646dd37f299b5425f1e9f89fb91fe0888e2815da34a48"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.0/cuenv-linux-arm64"
      sha256 "4d10775a5871bb28e863baf4380a08f94025a5109c4c6be7c5890594c83a5ff3"
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