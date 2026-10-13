# Homebrew cask for bAwake. Lives in the tap github.com/bernisoftware/homebrew-tap (Casks/bawake.rb):
#   brew install --cask bernisoftware/tap/bawake
# Update version and sha256 (build/release/SHA256.txt) after each release.
cask "bawake" do
  version "1.1.1"
  sha256 "33065083c664ee464a5ba807ebf61085d30590608f0662c366e25354e620776b"

  url "https://github.com/bernisoftware/bawake/releases/download/v#{version}/bAwake-#{version}.dmg"
  name "bAwake"
  desc "See why your Mac won't sleep and keep it awake while agents and builds run"
  homepage "https://www.bernisoftware.com.br/"

  livecheck do
    url "https://bernisoftware.github.io/bawake/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "bAwake.app"
  binary "#{appdir}/bAwake.app/Contents/Helpers/bawake"

  uninstall launchctl: "br.com.berni.bawake.helper",
            quit:      "br.com.berni.bawake"

  zap trash: [
    "~/Library/Caches/br.com.berni.bawake",
    "~/Library/HTTPStorages/br.com.berni.bawake",
    "~/Library/Preferences/br.com.berni.bawake.plist",
  ]
end
