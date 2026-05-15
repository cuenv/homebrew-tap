class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.41.5"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.5/cuenv-darwin-arm64"
      sha256 "0f1a423b87790b16cbc12d095b4b9d068b5f3d99477ac3edafc8f93a411bd53d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.5/cuenv-linux-x64"
      sha256 "87ed08741a6bb00ac1391f6d520707b3d8a1fdab7b2ac31fd2af1866381b0cf0"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.41.5/cuenv-linux-arm64"
      sha256 "8291207952fbaafe54192e3cab19fe1d873c496b0b6f4883a203d03ba76fe412"
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