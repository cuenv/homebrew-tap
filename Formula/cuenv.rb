class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.67.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.67.0/cuenv-darwin-arm64"
      sha256 "97096b9e95e2727ad2514bfe253994ab5649032962deb2cf0aab915f849f6598"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.67.0/cuenv-linux-x64"
      sha256 "17a9152189ed1759708a646adaf0ea69a6572b2275e70432683f923d655e4424"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.67.0/cuenv-linux-arm64"
      sha256 "71849613c3abb44347484066978384daba11fc51ede70b6d5132ca04e5c85418"
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