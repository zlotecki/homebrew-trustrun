cask "trust-run" do
  version "1.1.5"
  sha256 "7d3d5e497f147f290a339283b4e483c32f8267bdc40bcb191d5bf2437340bad6"

  url "https://github.com/zlotecki/trustrun-site/releases/download/v#{version}/Trust-Run-#{version}.dmg"
  name "Trust Run"
  desc "Safety net for code your AI writes"
  homepage "https://trustrun.app/"

  livecheck do
    url "https://trustrun.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Trust Run.app"

  uninstall launchctl: "com.trustrun.app",
            quit:      "com.trustrun.app"

  zap trash: [
    "~/.aisec",
    "~/Library/Caches/com.trustrun.app",
    "~/Library/Caches/com.trustrun.app.sparkle",
    "~/Library/LaunchAgents/com.trustrun.app.plist",
  ]
end
