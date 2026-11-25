class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.81.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.1/cuenv-darwin-arm64"
      sha256 "2a1de88e95ab4cf12071ec2d0af93d3412ae464ba3b9daa08bcbb39e707f7244"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.1/cuenv-linux-x64"
      sha256 "f9474ef178a0db827ce5f4f02aac532eb88fb2e21bbb088b2959eb8dd193b3cc"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.1/cuenv-linux-arm64"
      sha256 "287b3e20a643961fab6a6a49718a50ac5c9a28a932f806c3585dbe43dd0a70e8"
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