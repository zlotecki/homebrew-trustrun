cask "trust-run" do
  version "1.1.6"
  sha256 "94fc0e2e1ce445faf674eef83ffb744c45590a75ac013f0f5c66694b93743466"

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
