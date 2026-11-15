cask "lmux" do
  version "0.1.3"
  sha256 "b2a0e5919f802c1b35815187ce642d0997f51a6b161c87ac2d73f36ad77ba6ed"

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
