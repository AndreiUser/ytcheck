#!/bin/sh
# Link ytcheck into ~/.local/bin so `git pull` updates it in place.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.local/bin"
chmod +x "$DIR/ytcheck"
ln -sf "$DIR/ytcheck" "$HOME/.local/bin/ytcheck"
echo "Installed: $HOME/.local/bin/ytcheck -> $DIR/ytcheck"

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "Note: add ~/.local/bin to your PATH (log out and back in usually does it on Ubuntu)." ;;
esac

command -v mpv >/dev/null || echo "Note: mpv not found - sudo apt install mpv"
command -v yt-dlp >/dev/null || echo "Note: yt-dlp not found - sudo apt install yt-dlp"
