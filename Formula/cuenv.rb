class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.51.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.0/cuenv-darwin-arm64"
      sha256 "c9b4700f31f4898e4294fae846155b4478fcd7455fc3f667bd4873e445747a8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.0/cuenv-linux-x64"
      sha256 "dd9d446b53f00a4b8363643abe4f8abab073dbf7ba405f35c6d9d842fa8a5e55"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.0/cuenv-linux-arm64"
      sha256 "44d2d1bfcebf2e2d8374cbfb728521da71baa94016f6d1bd655e24c83104fa96"
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