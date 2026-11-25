class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.81.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.3/cuenv-darwin-arm64"
      sha256 "31b4abe4d9b35da1b48ee466f97f3c54f636b9e99870e92b4760f6a2da26ebe5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.3/cuenv-linux-x64"
      sha256 "7932c137a6d1f5a1d05b8e885ae32b3f7f01edf8294f1fcc2ab61b45ae74bac9"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.81.3/cuenv-linux-arm64"
      sha256 "a8ce85c813e60db1e7209fba05c8495ba2cf0b493476bbc560c7644854ac501b"
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