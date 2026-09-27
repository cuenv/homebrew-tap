class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.56.6"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.6/cuenv-darwin-arm64"
      sha256 "2b759620cb5856a5ff3d336d10614c694ad65af083d49aacd71283ebc231aafc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.6/cuenv-linux-x64"
      sha256 "081a3e8e0efad15e5f6716f91e179e7e09c24502c6e7a9dbbb1f1268564042b5"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.56.6/cuenv-linux-arm64"
      sha256 "8a65c3bb88d9f62a64613860e604a7e81e18a01ab532fa53ad7049a5dda8cbe8"
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