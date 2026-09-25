class Stemsplit < Formula
  desc "AI-powered audio stem separation from the command-line"
  homepage "https://stemsplit.io"
  url "https://github.com/StemSplit/stemsplit-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bab1a0c413a663a81ecdeaf033c9bb57477d5767f8325264a2f70de6048a9751"
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
