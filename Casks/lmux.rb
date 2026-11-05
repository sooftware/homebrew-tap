cask "lmux" do
  version "0.1.0"
  sha256 "3400221de4102e6fc8a3b37755c4fd2734950288a7f06c1fede50b7176eef842"

  url "https://github.com/sooftware/lmux/releases/download/v#{version}/lmux-#{version}-arm64.zip"
  name "lmux"
  desc "Lightweight terminal with workspaces and Claude Code/Codex agent status"
  homepage "https://lmux.dev/"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

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
