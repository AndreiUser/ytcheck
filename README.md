# ytcheck

List recent videos from a list of YouTube channels and play them — or just their audio — in [mpv](https://mpv.io/) (which uses [yt-dlp](https://github.com/yt-dlp/yt-dlp)).

No API key: it reads YouTube's public RSS feeds. Only needs Python 3.

## Install

```bash
sudo apt install mpv yt-dlp      # or: pipx install yt-dlp  (newer version)
git clone https://github.com/AndreiUser/ytcheck.git ~/ytcheck
~/ytcheck/install.sh
```

`install.sh` links `ytcheck` into `~/.local/bin`, so updating is just:

```bash
cd ~/ytcheck && git pull
```

## Channels

One per line in `~/.config/ytcheck/channels.txt` (`#` starts a comment):

```
@veritasium
https://www.youtube.com/@3blue1brown
https://www.youtube.com/channel/UCsXVk37bltHxD1rDPwtNM8Q
```

Or add one with `ytcheck --add @handle`.

## Usage

```bash
ytcheck                 # links from the last 7 days
ytcheck -d 2 -v         # last 2 days, with channel, date and title
ytcheck --new           # only videos not shown before
ytcheck --play          # play them in mpv (oldest first)
ytcheck --audio         # sound only
ytcheck -s              # skip Shorts
mpv $(ytcheck -d 1)     # pipe links into mpv yourself
```

mpv keys: `Space` pause, `Enter`/`>` next, `<` previous, `←`/`→` seek, `q` quit.

Note: each channel feed only contains its 15 newest videos.
