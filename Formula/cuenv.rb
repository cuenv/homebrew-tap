class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.51.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.3/cuenv-darwin-arm64"
      sha256 "0dccf15a9da3821802144170342cb92e9c91309ae363f2563bf4edbe57a5ea7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.3/cuenv-linux-x64"
      sha256 "faf2a19ed250879f4ab4c0c44104f46a6361cca2e29edd89f8fc97da5c033b13"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.3/cuenv-linux-arm64"
      sha256 "5cc497acae7a43618d68f315cb9b639ef99937c06684d3de4394036e57623528"
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