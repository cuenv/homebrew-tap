class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.58.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.58.1/cuenv-darwin-arm64"
      sha256 "12fc10218207e5f1683c0caa361e73c056cb86e9abfb7aaa6d1e98ab9bc272b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.58.1/cuenv-linux-x64"
      sha256 "1ae0a45c501f509be691cd3b5470023e7eb8e95c777d51d9f5553caebfa32005"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.58.1/cuenv-linux-arm64"
      sha256 "543c6c7ba922593e1432bc4606297e30fd322ae4d05fed80533ba4c1203e0fc3"
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