class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.43.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.43.0/cuenv-darwin-arm64"
      sha256 "2fb6416da8e16842a38bad4ea193dc833936633c926e4139f1a4c9f106507cba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.43.0/cuenv-linux-x64"
      sha256 "926a0b0c13ab4b848d2cf5597449fc6839e0335a15f412740aecc5e3a4efe391"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.43.0/cuenv-linux-arm64"
      sha256 "7765b78b5cd0ed924d2dbe26c81427f36762ca6e3803db8bf668936fe0c60396"
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