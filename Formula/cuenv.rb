class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.77.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.77.1/cuenv-darwin-arm64"
      sha256 "9672bad1d62c3390c84bb5fc209b3dabb8b5fb140dc3d4f37f106808da742097"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.77.1/cuenv-linux-x64"
      sha256 "ebbd618ab47cec51a8cdd6ec723584317c9f0e9ab8c776a8c86ac0abbcdd7fa7"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.77.1/cuenv-linux-arm64"
      sha256 "715d11f172013f115c8ba4c06c0ad9f5987ed5750a050e575f4a51fa541c3e3e"
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