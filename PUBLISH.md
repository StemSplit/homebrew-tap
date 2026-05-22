# Publishing homebrew-tap

Tap: `StemSplit/tap` — provides `brew install stemsplit-io/tap/stemsplit`
GitHub: https://github.com/StemSplit/homebrew-tap

## How Homebrew taps work

This repo is a [Homebrew tap](https://docs.brew.sh/Taps). It contains formula files under `Formula/` that tell Homebrew where to download and how to build the `stemsplit` CLI.

Users install via:
```bash
brew tap stemsplit-io/tap
brew install stemsplit
```

## Updating the formula after a new CLI release

After a new `stemsplit-cli` tag is created and the GitHub release is published:

1. **Get the tarball SHA256**:
   ```bash
   curl -sL https://github.com/StemSplit/stemsplit-cli/archive/refs/tags/v0.2.0.tar.gz | sha256sum
   ```

2. **Edit `Formula/stemsplit.rb`** — update `url` and `sha256`:
   ```ruby
   url "https://github.com/StemSplit/stemsplit-cli/archive/refs/tags/v0.2.0.tar.gz"
   sha256 "abc123..."
   ```

3. **Commit and push**:
   ```bash
   git add Formula/stemsplit.rb
   git commit -m "chore: update stemsplit to v0.2.0"
   git push origin main
   ```

Homebrew will automatically pick up the new formula on the next `brew update`.

## Testing the formula locally

```bash
# Audit formula for issues
brew audit --new Formula/stemsplit.rb

# Install from local tap
brew install --build-from-source Formula/stemsplit.rb

# Verify the install
stemsplit --version
```

## No CI/CD needed

This tap is manually updated after each CLI release. There is no automated CI for the tap itself — just edit, commit, and push.
