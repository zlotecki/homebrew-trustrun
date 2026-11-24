cask "trust-run" do
  version "1.1.2"
  sha256 "9ad5ee6e0ad33e64cca9b646f27fcff0e4f2f9263b72de193ec896838ec5bc88"

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
  depends_on macos: ">= :monterey"

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
