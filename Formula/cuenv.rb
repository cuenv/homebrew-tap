class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.55.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.55.1/cuenv-darwin-arm64"
      sha256 "bd8745d5513fc8fb92ea386cfe494c11ffeff56642d55d5fd707f8fc946e1479"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.55.1/cuenv-linux-x64"
      sha256 "f5866d7a50f640f58396687be648d547327a4eb8ce02a3a54c0fc16b22bd8b95"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.55.1/cuenv-linux-arm64"
      sha256 "9b6d2961ff95f096e9d5bd1dfbc6e8d9db1d2caf5d2943074a0e129928ba3295"
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