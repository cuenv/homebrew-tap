class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.64.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.64.0/cuenv-darwin-arm64"
      sha256 "5f92dcc19ebc81a0463a3e17f60cffaae7133bb1db64264c1dd79b8af9225479"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.64.0/cuenv-linux-x64"
      sha256 "d41b66a3dfe08b2bf3e2778853872f70a5c04cbe6ab219fb88abe214de28510b"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.64.0/cuenv-linux-arm64"
      sha256 "b480962fd860590eb95b3bd0616f793e12dde66848380d41f67cd188272655ff"
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