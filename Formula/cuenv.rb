class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.55.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.55.0/cuenv-darwin-arm64"
      sha256 "a4584dd0e2f3b98e09208ac6e1419fb56aca15ac50c2f39f830b18c80d1b6212"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.55.0/cuenv-linux-x64"
      sha256 "8a80ea159e4da110be292e2bb1d17ef110ee9036fa28e969d07065e652086164"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.55.0/cuenv-linux-arm64"
      sha256 "ac324faa83c50fdc5fcd8e4c007795f9f88dcb8c42d1c8876795217143fa835e"
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