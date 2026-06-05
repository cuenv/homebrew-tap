class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.51.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.2/cuenv-darwin-arm64"
      sha256 "83f1a5134c9af93d12936b5fe73be3d2468a6507dd02dcc9a6b6e9a60da95bdf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.2/cuenv-linux-x64"
      sha256 "df28a9275a6e320a7144748076d21e2d64462736ea08ac8aaf6610331f560f43"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.51.2/cuenv-linux-arm64"
      sha256 "9d2de908c1dd21f827f74f18109ca5c7c0c45b9b5aef485a8cbcf2612c576c73"
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