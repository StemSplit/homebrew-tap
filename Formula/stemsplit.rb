class Stemsplit < Formula
  desc "AI-powered audio stem separation from the command line"
  homepage "https://stemsplit.io"
  url "https://github.com/StemSplit/stemsplit-cli/archive/refs/tags/v0.1.0.tar.gz"
  # sha256 will be populated automatically by `brew bump-formula-pr` after the first release
  # sha256 "placeholder - update after tagging v0.1.0"
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
