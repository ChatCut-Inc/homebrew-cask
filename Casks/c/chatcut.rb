cask "chatcut" do
  arch arm: "arm64", intel: "x64"

  version "0.9.3,41848233907-1"
  sha256 arm:   "c031df60f217231db5a43f3d5c8b867314659a372231eb75eb793256c51ef7a5",
         intel: "d012f0b70cff80a4ba876a0a31fcc11c6ea7109e2ba083f7ccf404eb6ab9b7f7"

  url "https://api.chatcut.io/desktop/update/global/ChatCut-#{version.csv.first}-#{arch}-candidate-#{version.csv.second}.dmg"
  name "ChatCut"
  desc "AI-powered video editor"
  homepage "https://chatcut.io/"

  livecheck do
    url "https://api.chatcut.io/desktop/update/global/latest-mac.yml"
    regex(/^ChatCut[._-]v?(\d+(?:\.\d+)+)-#{arch}-candidate-(\d+-\d+)\.dmg$/i)
    strategy :electron_builder do |yaml, regex|
      yaml["files"]&.map do |item|
        match = item["url"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[2]}"
      end
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "ChatCut.app"

  zap trash: [
    "~/Library/Caches/io.chatcut.desktop",
    "~/Library/Logs/ChatCut",
    "~/Library/Saved Application State/io.chatcut.desktop.savedState",
  ]
end
