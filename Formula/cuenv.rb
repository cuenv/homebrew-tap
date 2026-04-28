class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.41.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.2/cuenv-darwin-arm64"
      sha256 "5b46a15ebeb91c66cb07a5d962d4424187c129a44c830bf5d54ede7151975adf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.2/cuenv-linux-x64"
      sha256 "4932c23d4d7c587a546f365e745f12767c1a8fc18383efec47b5ae26b3dd7b5d"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.2/cuenv-linux-arm64"
      sha256 "a6b8b0a2772b2f2dd71741eacb27d461391283db8ffe7534a8b9eb7eef9a973e"
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