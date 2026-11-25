class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.81.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.0/cuenv-darwin-arm64"
      sha256 "5ffdd7ae924bf2fc99a49948630966367bb80fc3a0d723a1dff930aabfb85e53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.0/cuenv-linux-x64"
      sha256 "691ed7b8d6bef8531ca18a5255b5390334b8ba02fe41ced726420c6b21837b81"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.0/cuenv-linux-arm64"
      sha256 "bccca011afd0230a76d394d6563afee0fb64708d5bea037f026ec0698d0cfcc0"
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