class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.71.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.71.0/cuenv-darwin-arm64"
      sha256 "da80d4223caf380b53c09c5619959c6ac35ee809a93d3f0763d86d566b3fbb6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.71.0/cuenv-linux-x64"
      sha256 "387796528600d821625ae12c2e3c1ec2d5990a67effdc4b46676fa33ca57b363"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.71.0/cuenv-linux-arm64"
      sha256 "99b52866607ed4e766abe48d3f8af1ca5e158968bfe537fa439a3a71bb052b2a"
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