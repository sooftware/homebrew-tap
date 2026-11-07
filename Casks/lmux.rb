cask "lmux" do
  version "0.1.1"
  sha256 "825c516aedb1e590a1d5d64e19035bf7dc798b10300598f0ba98560b4ae03172"

  url "https://github.com/sooftware/lmux/releases/download/v#{version}/lmux-#{version}-arm64.zip"
  name "lmux"
  desc "Lightweight terminal with workspaces and Claude Code/Codex agent status"
  homepage "https://lmux.dev/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "lmux.app"
  # The bundled `lmux` CLI (Contents/Resources/bin/lmux, see App/scripts/bundle.sh).
  binary "#{appdir}/lmux.app/Contents/Resources/bin/lmux"

  # The Claude Code / Codex hooks lmux adds are removed from inside the app:
  # lmux > Uninstall Claude Code Hooks... (and Uninstall Codex Hooks...).
  zap trash: [
    "~/.config/lmux",
    "~/Library/Application Support/lmux",
    "~/Library/Preferences/dev.lmux.app.plist",
    "~/Library/Saved Application State/dev.lmux.app.savedState",
  ]
end
