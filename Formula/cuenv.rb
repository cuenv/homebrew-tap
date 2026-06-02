class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.51.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.1/cuenv-darwin-arm64"
      sha256 "d0246745bd58ae26caaaba13fc801122f7c71d8d68fcbf0b420cde58e387ac0e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.1/cuenv-linux-x64"
      sha256 "16d910e2687029f1489c02f0fd9a8a06a2faf0cd5927281a0562fe4856d48f05"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.1/cuenv-linux-arm64"
      sha256 "efc3dcaab47e83a309b2b770ff5b67fb8b243d41cffcf389a1bfa655d6eb46a7"
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