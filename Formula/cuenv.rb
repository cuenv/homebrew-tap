class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.76.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.76.1/cuenv-darwin-arm64"
      sha256 "e83e91d8421b800f08adac153d22bc9be0bb0aa830207f2fed5e6648b1931160"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.76.1/cuenv-linux-x64"
      sha256 "3d1f29083f7873fef404ef5bb0116269803c9cda7f765de2daf62fa2648bd102"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.76.1/cuenv-linux-arm64"
      sha256 "653bbd07f3241870ad9ebeda358fbf858089a96a27eb42e15c7820cd75fffea4"
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