cask "chatcut" do
  version "0.9.3"

  on_arm do
    sha256 "c031df60f217231db5a43f3d5c8b867314659a372231eb75eb793256c51ef7a5"

    url "https://api.chatcut.io/desktop/update/global/ChatCut-#{version}-arm64-candidate-41848233907-1.dmg"
  end
  on_intel do
    sha256 "d012f0b70cff80a4ba876a0a31fcc11c6ea7109e2ba083f7ccf404eb6ab9b7f7"

    url "https://api.chatcut.io/desktop/update/global/ChatCut-#{version}-x64-candidate-41848233907-1.dmg"
  end

  name "ChatCut"
  desc "AI-powered video editor"
  homepage "https://chatcut.io/"

  livecheck do
    url "https://api.chatcut.io/desktop/update/global/latest-mac.yml"
    regex(/^version:\s*["']?(\d+\.\d+\.\d+)/i)
  end

  no_autobump! because: "Download URLs include a release-specific build identifier"

  auto_updates true
  depends_on macos: :ventura

  app "ChatCut.app"

  zap trash: [
    "~/Library/Caches/io.chatcut.desktop",
    "~/Library/Logs/ChatCut",
    "~/Library/Saved Application State/io.chatcut.desktop.savedState",
  ]
end
