class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.70.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.2/cuenv-darwin-arm64"
      sha256 "285dc32c07c127ad704e076be904554f491d316b04f465e0297b1f0c87043c5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.2/cuenv-linux-x64"
      sha256 "fb27bbddb50b8899154b5fcdee559d0f825b61ffbc9e50a405e8f364b60302cf"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.70.2/cuenv-linux-arm64"
      sha256 "62892cfc38f01badd10742e12c7f42fd11af33bba342993d4bb1f248df1f2dd7"
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