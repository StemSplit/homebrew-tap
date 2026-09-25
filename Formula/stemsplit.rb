class Stemsplit < Formula
  desc "AI-powered audio stem separation from the command-line"
  homepage "https://stemsplit.io"
  url "https://github.com/StemSplit/stemsplit-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "94f38abb417b4ff6b9c9c2065b1b652aaa300757a3d321c431866416bf32b909"
  license "MIT"
  head "https://github.com/StemSplit/stemsplit-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    assert_match "stemsplit", shell_output("#{bin}/stemsplit --version")
  end
end
