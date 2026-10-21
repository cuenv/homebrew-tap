class Cuenv < Formula
  desc "Modern application build toolchain with typed environments and CUE-powered task orchestration"
  homepage "https://github.com/cuenv/cuenv"
  version "0.57.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.3/cuenv-darwin-arm64"
      sha256 "2c93edfb642669d79219ccece1e94a8c95ffe26c0f0e2c289558e977b6e61867"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.3/cuenv-linux-x64"
      sha256 "70b2097cb21afde54cbba72756fc654910cee18dd5330e6ed79b0de0748d8843"
    end

    on_arm do
      url "https://github.com/cuenv/cuenv/releases/download/0.57.3/cuenv-linux-arm64"
      sha256 "a054ee9e05b18aa05ff359906c3c73a2f90a14e963d6ad3e848474431034e02a"
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