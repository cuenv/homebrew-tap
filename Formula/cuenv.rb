class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.78.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.78.0/cuenv-darwin-arm64"
      sha256 "acef399c09eb8445e2a28a895a30de8cc71c9666a544c314031fcf60a73c8e0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.78.0/cuenv-linux-x64"
      sha256 "4f582623e67a12fab3814e2ec72d053e5fc17ee105a1071d016a9fdf9bfe31b3"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.78.0/cuenv-linux-arm64"
      sha256 "b56f3af9d25132320f1dd240fffcd45b4a7e6873fb1bbd8a72330b74582ea07b"
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