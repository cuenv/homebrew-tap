class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.53.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.0/cuenv-darwin-arm64"
      sha256 "7068fe7cbbfc76c7ef8f8118f43ab24519e913039cbbcc14520c7ba3d489e970"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.0/cuenv-linux-x64"
      sha256 "b22041f0a96c16ab4f0d1d200fcb0c35d194f22481a879b428d4a83d4370e57d"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.53.0/cuenv-linux-arm64"
      sha256 "53af211fb5ff00f9cc1bf7b4ae7d20c8c08c755a3f6d82a7c8052f93911a1a24"
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