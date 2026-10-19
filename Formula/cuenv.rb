class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.57.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.2/cuenv-darwin-arm64"
      sha256 "8f91692165da44a9c2c11f416e9343e38350b46f61c4c0c13a638c8164bc35ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.2/cuenv-linux-x64"
      sha256 "1f8ae53d4006045a69a71af543a9fa8b3e4a7e46bcd5d1e9c7e831175c586090"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.2/cuenv-linux-arm64"
      sha256 "47fc07318fb6413f032cc159a2b560cf0cc6e12fab8f6c469e284e16544c37a9"
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