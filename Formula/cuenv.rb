class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.80.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.80.0/cuenv-darwin-arm64"
      sha256 "4019d88123fee98aa76ad4719892a2f61ab22067b648d4c6d3126e9f1a770e12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.80.0/cuenv-linux-x64"
      sha256 "0171fff68ef7762fad474732640a23dc3ea16de353008c90db17d88c6bc8c7b6"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.80.0/cuenv-linux-arm64"
      sha256 "59ae163d43b52b132508cdf25e8dfbce9befd8bc14028314e74002a6acba07f4"
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