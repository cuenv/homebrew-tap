class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.79.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.79.0/cuenv-darwin-arm64"
      sha256 "f511d18bc9d1ca46b0d8177f4176dca7fae32a41e58a3950a66b70f828ed5f19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.79.0/cuenv-linux-x64"
      sha256 "94e71954199bd8c5d80da1dfc6db70dc0f9132c66560149518051f9caff762aa"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.79.0/cuenv-linux-arm64"
      sha256 "567476910070ba7225bb7f23de9f1cb0ad3bcc018848bf2bd644f7fda0c4d1ef"
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