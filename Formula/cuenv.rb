class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.54.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.54.0/cuenv-darwin-arm64"
      sha256 "1f84163758beb830443a42ac25e4572ee520f368d991162047011fdde87bb653"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.54.0/cuenv-linux-x64"
      sha256 "2d4d0d2f9a72652f01a3f3dd9cb684730b61b5dd307e1114d9d6d89a82d92ba1"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.54.0/cuenv-linux-arm64"
      sha256 "7933572ceff9d58f55dcc9d127a4fc242eb9ba53e668316ce42f57c3dc7af351"
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