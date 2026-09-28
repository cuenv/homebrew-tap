class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.56.7"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.7/cuenv-darwin-arm64"
      sha256 "12d8afea09f99e8438f06f483ce4e4aaf4e57f66296ef4fb7fbca2700a8d23f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.7/cuenv-linux-x64"
      sha256 "de1e5080fca8abcd06a723a66df8661e163dad7941a96537167e0e149d77a909"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.7/cuenv-linux-arm64"
      sha256 "3227033f4bffb4b30272c8efecfdb415187390745f142a46ef3620794b3c27dc"
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