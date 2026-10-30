class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.63.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.63.1/cuenv-darwin-arm64"
      sha256 "568f8d1aef859cf3adc81c800b52cf48172e6db0765294e91e8e8e873e65df0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.63.1/cuenv-linux-x64"
      sha256 "60ef2f538317a04d8633699ade5473e5d8bb953e96b17aa635f76ea13edf0ac3"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.63.1/cuenv-linux-arm64"
      sha256 "a156aaf209f80884431a53a99f7f6a0c03fcb827b105cf58331ed2517743fb43"
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