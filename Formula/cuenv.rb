class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.66.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.66.0/cuenv-darwin-arm64"
      sha256 "13ab2f8e55ba0c68160a39afa168f84f3f19bd825fd62f13777f04640d40bea2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.66.0/cuenv-linux-x64"
      sha256 "217b1dda7b940cc1a5052f0e27267294cfa871dc36622a40cca25b421febe45a"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.66.0/cuenv-linux-arm64"
      sha256 "19a1ff5e94d9f2ad3b1ec2f41c2fe6c07d2a928fa85fd9cb7b282c3efe05792e"
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