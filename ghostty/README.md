# Ghostty setup notes

Working document. Decide what you want, then we write `ghostty/config`.

Environment this was written against:

- Ghostty 1.3.1, stable, Metal renderer, CoreText font engine
- tmux 3.6a
- macOS (Darwin 23.6.0)
- No existing Ghostty config
- `xterm-ghostty` terminfo present

Mark each setting below: keep / drop. Nothing is installed yet.

---

## 1. How the config works

Single file at `~/.config/ghostty/config`. Plain `key = value`, `#` for comments.
No language, no scripting.

Mechanics worth knowing:

- Repeating a key **appends** for list-type keys (`font-family`, `keybind`,
  `font-feature`, `config-file`). It **overwrites** for scalar keys.
- `ghostty +show-config --default --docs` prints all 634 options with their
  documentation, for your exact build. This beats the website, which documents
  whatever version is current.
- `ghostty +validate-config` checks syntax.
- `cmd+shift+,` reloads without a restart. A few keys need a full restart; their
  docs say so.
- `config-file = path` includes another file, so the config can be split.

Dotfiles wiring: file lives at `~/.dotfiles/ghostty/config`, and `setup.sh`
symlinks `~/.config/ghostty` to `~/.dotfiles/ghostty`.

---

## 2. Settings, line by line

### 2.1 Font

```
# font-family = "FiraCode Nerd Font"
font-size = 14
font-feature = -calt
font-feature = -liga
font-feature = -dlig
```

**`font-family`** — picks the font.

You can skip this. Ghostty bundles JetBrains Mono plus Nerd Font symbols.
`ghostty +list-fonts | grep -i fira` returns nothing on this machine. Your
`fonts/Fira Code Retina Nerd Font Complete Mono.otf` sits in the repo but was
never installed into the system. The bundled default gives you nerd icons with
zero setup, which is the minimal answer.

If you want Fira back: `brew install --cask font-fira-code-nerd-font`, then
uncomment the line.

**`font-size = 14`** — your old iTerm profile used 13. Taste only.

**`font-feature = -calt / -liga / -dlig`** — disables programming ligatures, so
`!=` stays two characters instead of rendering as a single glyph.

Skip these three if you like ligatures. The argument for turning them off is
column alignment in diffs and in agent output. The argument for leaving them on
is that you have used them for years and never complained.

### 2.2 Theme and appearance

```
theme = light:Selenized Light,dark:Selenized Dark
window-padding-x = 8
window-padding-y = 4
window-padding-balance = true
cursor-style = block
mouse-hide-while-typing = true
```

**`theme`** — the `light:X,dark:Y` form switches with the macOS system
appearance. Ghostty ships 463 built-in themes; browse with
`ghostty +list-themes`. Adopting a built-in lets you delete
`iterm/nord.itermcolors`.

**Why Selenized** — it is Solarized rebuilt, by Jan Warchoł, and it fixes the
specific thing that made Solarized Dark feel muddy.

Solarized uses the **same eight accent colors** for light and dark. Those
accents were tuned against the cream background, so on `#002b36` they go grey.
Selenized recomputes accents per background.

Measured on this machine (WCAG contrast ratios):

| | Solarized | Selenized |
|---|---|---|
| Light background | `#fdf6e3` | `#fbf3db` |
| Light foreground contrast | 4.13:1 | **5.37:1** |
| Dark background | `#002b36` | `#103c48` |
| Dark foreground contrast | 4.75:1 | **6.07:1** |
| Dark red accent | 3.25:1 | 3.71:1 |
| Dark green accent | 4.69:1 | 4.97:1 |

The light background sits 3 hex points from Solarized Light, so the half you
already like is preserved. Solarized Light at 4.13:1 fails WCAG AA for body
text; Selenized Light clears it.

Variants available: `Selenized Light`, `Selenized Dark`, `Selenized Black`
(pure `#000000` ground, same accents).

The full palettes are in §3, because tmux and nvim need them too.

**`window-padding-x` / `window-padding-y`** — pixel gap between text and window
edge. Cosmetic.

**`window-padding-balance`** — distributes leftover pixels evenly instead of
putting them all on one side. Cosmetic, but it stops the layout shifting as you
resize.

**`cursor-style = block`** — cursor shape. Note that shell integration's
`cursor` feature overrides this to a bar at the prompt, so you get a bar while
typing a command and a block while one runs.

**`mouse-hide-while-typing`** — hides the pointer while typing. Cosmetic.

Dropped from the earlier draft: `background-opacity = 1` is already the default.

### 2.3 Window chrome — where tmux matters most

```
window-show-tab-bar = never
macos-titlebar-style = tabs
macos-option-as-alt = true
window-save-state = never
confirm-close-surface = false
quit-after-last-window-closed = true
```

**`window-show-tab-bar = never`** — removes Ghostty's tab strip.

Recommended. You have used tmux for years. Two layers of tabs means two places
to look for the same window, and Ghostty's tabs do not survive a restart the way
a tmux session does.

**`macos-titlebar-style = tabs`** — merges the titlebar and tab bar into one
thin native bar.

With the tab bar hidden, `hidden` may suit you better; it removes the titlebar
entirely and gives you the full window height. Try both. Values: `native`,
`transparent`, `tabs`, `hidden`.

**`macos-option-as-alt = true`** — sends `ESC` + key instead of the macOS
special character, so option-b reaches your shell as Meta-b.

Required if you want Meta bindings in tmux, zsh, or nvim.

**Cost:** you lose macOS option-key characters (`¯`, `©`, `æ`, and on some
layouts `#`, `@`, `[`, `]`). Set to `left` instead of `true` to keep the right
option key free for typing those. If you do not use Meta bindings at all, drop
this line.

**`window-save-state = never`** — Ghostty does not restore windows on relaunch.

Recommended. You already run `tmux-resurrect` and `tmux-continuum`. Two restore
mechanisms fight each other: Ghostty restores a window, tmux restores a session
into it, and you end up with duplicates.

**`confirm-close-surface = false`** — removes the "are you sure" dialog on
`cmd+w`.

Safe here **because tmux is the process owner**. The tmux server runs detached
from any terminal. Closing a Ghostty window detaches the client; the session,
its panes, and anything running in them keep going. `tmux attach` brings it all
back. The dialog is protecting against a loss that cannot happen.

The one gap: work started **outside** tmux — a quick command in a fresh window,
or something in the quick terminal — dies with the surface and no prompt. If
that bothers you, the habit fix is to start every window in tmux rather than to
keep the dialog. See `initial-command` if you want that automatic.

**`quit-after-last-window-closed = true`** — quits the app when the last window
closes, rather than leaving it in the dock. Preference. macOS convention is to
keep running.

Note these two compose: with both set, `cmd+w` on your last window quits Ghostty
outright, no confirmation. That is the intended behaviour when tmux holds the
state, but it is abrupt if you are not expecting it.

### 2.4 Shell integration

```
shell-integration = zsh
shell-integration-features = cursor,no-title,sudo,ssh-env,ssh-terminfo,path
```

Ghostty injects a zsh script that emits OSC 133 escape sequences. These mark
where each prompt starts, where a command starts, and where it ends. That
marking is what powers jump-to-prompt, command-finish notifications, and
working-directory inheritance for new splits.

**`shell-integration = zsh`** — forces zsh mode instead of autodetecting.
Autodetect works. This is explicitness, not function. Optional.

Then the features, each keep/drop on its own:

| Feature | Effect | Notes |
|---|---|---|
| `cursor` | Bar cursor at the prompt, block while a command runs | Free visual signal for "is something still running" |
| `no-title` | Stops Ghostty setting the window title | **Recommended for you.** tmux sets the title itself; without this they fight |
| `sudo` | Preserves `TERMINFO` across `sudo` | Off by default. Prevents `sudo nvim` rendering badly |
| `ssh-env` | Rewrites `TERM=xterm-ghostty` to `xterm-256color` when you ssh | Fixes remote hosts that do not know Ghostty's terminfo |
| `ssh-terminfo` | Installs Ghostty's terminfo on the remote host via `infocmp`/`tic`, then caches the fact | Better than `ssh-env` — you keep full capabilities remotely. Both can be on; terminfo is tried first, env is the fallback |
| `path` | Adds Ghostty's bin directory to `PATH` | On by default. Makes the `ghostty` CLI reachable |

Drop `ssh-env` and `ssh-terminfo` if you never ssh from this machine.

### 2.5 The agentic block

```
notify-on-command-finish = unfocused
notify-on-command-finish-after = 30s
notify-on-command-finish-action = no-bell,notify
bell-features = attention,title,border,no-audio,no-system
```

**`notify-on-command-finish = unfocused`** — sends a notification when a command
finishes, but only when the Ghostty window is not focused. New in 1.3.0. Values:
`never` (default), `unfocused`, `always`.

**`notify-on-command-finish-after = 30s`** — only notify for commands that ran
longer than this. The default is 5s, which fires on every `git status`.

**`notify-on-command-finish-action = no-bell,notify`** — use a macOS
notification rather than the terminal bell. Default is `bell,no-notify`.

**`bell-features`** — what happens when a program rings the bell:

- `attention` — bounces the dock icon once (on by default)
- `title` — prepends a bell emoji to the surface title (on by default)
- `border` — draws a border around the alerted surface (off by default)
- `audio` — plays a custom sound file (off)
- `system` — plays the macOS system alert sound (off)

#### The caveat that decides this whole block

`notify-on-command-finish` needs OSC 133 to reach Ghostty. tmux consumes OSC 133
to build its own prompt tracking and does not forward it outward. So inside a
tmux session this feature is unreliable at best.

What **does** survive tmux is the bell, and OSC 9 / OSC 777 desktop
notifications — but only if tmux is told to pass escape sequences through.
Add to `tmux.conf`:

```
set -g allow-passthrough on
set -g visual-bell off
set -g bell-action any
```

`allow-passthrough on` is the important line. It lets a program inside a pane
send escape sequences that reach Ghostty. That is how a Claude Code notification
hook, or a `printf '\033]9;build done\007'` at the end of a long task, gets to
Notification Center. Without it, tmux swallows them.

**Verdict:** keep `bell-features`, add the three tmux lines, and treat
`notify-on-command-finish` as a bonus for the times you run outside tmux.

### 2.6 Security

All three of these are already the default. Include them only as documentation,
or drop them.

**`clipboard-paste-protection = true`** — confirmation prompt when pasting
content with newlines or control characters. Real value when working with
agents: it catches a paste that would otherwise execute the moment it lands.

**`clipboard-read = ask`** — prompts when a program tries to read your
clipboard.

**`title-report = false`** — blocks `CSI 21 t`, the sequence that lets a running
program read the window title back. Ghostty's own docs call this a common
security issue: a maliciously crafted title plus minor user interaction is a
code-execution path. Leave it off.

### 2.7 Scrollback

`scrollback-limit` is near-useless for you. tmux keeps its own history buffer,
so Ghostty's scrollback stays roughly one screen tall inside a session. Set the
tmux equivalent instead:

```
set -g history-limit 100000
```

The same reasoning undercuts Ghostty's `cmd+f` scrollback search inside tmux —
there is almost nothing in Ghostty's buffer to search. Use tmux copy-mode search
(`prefix [`, then `/`).

### 2.8 Keybindings

```
keybind = cmd+shift+r=toggle_readonly
keybind = global:cmd+grave_accent=toggle_quick_terminal
quick-terminal-position = top
quick-terminal-autohide = true
quick-terminal-animation-duration = 0
```

**`toggle_readonly`** — locks the surface so keystrokes are ignored.

Genuinely useful with agents, and neither iTerm2 nor kitty has a direct
equivalent. Stops a stray keypress landing in a running agent's prompt.

**`toggle_quick_terminal`** — a dropdown terminal that slides in from a screen
edge. The `global:` prefix is the notable part: the binding fires even when
Ghostty is not the focused application.

Good for a dedicated long-running agent session you glance at from any app. Skip
the whole group if you dislike hotkey windows.

`quick-terminal-position` accepts `top`, `bottom`, `left`, `right`, `center`.
Setting `animation-duration = 0` makes it appear instantly.

Dropped from the earlier draft: `cmd+shift+s=write_screen_file:open`, which
dumps the visible screen to a file and opens it. Inside tmux it captures one
pane's visible area only. `tmux capture-pane -pS -100000` does strictly more.

Also worth knowing: `ctrl+h`, `ctrl+j`, `ctrl+k`, `ctrl+l` and `ctrl+\` are not
bound by Ghostty. Your vim-tmux-navigator bindings in `tmux.conf:100-111` are
safe. Do not bind them here.

---

## 3. Selenized across the stack

Ghostty alone is not enough. Your `nord-tmux` plugin paints the status bar with
hardcoded Nord hex values, and `nord.nvim` paints the editor. Both will clash
until swapped.

### 3.1 The palettes

| Slot | Light | Dark |
|---|---|---|
| background | `#fbf3db` | `#103c48` |
| foreground | `#53676d` | `#adbcbc` |
| 0 black | `#ece3cc` | `#184956` |
| 1 red | `#d2212d` | `#fa5750` |
| 2 green | `#489100` | `#75b938` |
| 3 yellow | `#ad8900` | `#dbb32d` |
| 4 blue | `#0072d4` | `#4695f7` |
| 5 magenta | `#ca4898` | `#f275be` |
| 6 cyan | `#009c8f` | `#41c7b9` |
| 7 white | `#53676d` | `#adbcbc` |
| 8 br black | `#909995` | `#72898f` |
| 9 br red | `#cc1729` | `#ff665c` |
| 10 br green | `#428b00` | `#84c747` |
| 11 br yellow | `#a78300` | `#ebc13d` |
| 12 br blue | `#006dce` | `#58a3ff` |
| 13 br magenta | `#c44392` | `#ff84cd` |
| 14 br cyan | `#00978a` | `#53d6c7` |
| 15 br white | `#3a4d53` | `#cad8d9` |

Note slot 0. Solarized-family themes use it as a subtle background tint rather
than black. That is what makes a status bar built on `colour0` look right.

### 3.2 tmux — write it by hand, drop the plugin

**There is no official Selenized tmux theme.** The upstream repo ships ports for
15 terminals, Vim, VS Code, i3, rofi, dircolors, and Midnight Commander — but
not tmux.

That is fine, and arguably better. Write the status line against **palette
indices** rather than hex:

```
# Selenized. Uses palette indices, so it follows Ghostty's light/dark switch
# with no tmux-side configuration.
set -g status-style "bg=colour0,fg=colour7"
set -g status-left  "#[fg=colour6,bold] #S #[default]"
set -g status-right "#[fg=colour8]%d %b #[fg=colour7]%R "
set -g window-status-format         "#[fg=colour8] #I:#W "
set -g window-status-current-format "#[fg=colour4,bold] #I:#W "
set -g window-status-activity-style "fg=colour3"
set -g pane-border-style        "fg=colour0"
set -g pane-active-border-style "fg=colour6"
set -g message-style "bg=colour0,fg=colour6"
set -g mode-style    "bg=colour6,fg=colour0"
```

**Why indices beat hex here.** `colour0` through `colour15` resolve against
whatever palette the terminal is currently showing. Ghostty swaps between
Selenized Light and Selenized Dark when macOS changes appearance, and the tmux
status bar follows for free. Hardcoded hex cannot do that — it would need a
second config and a manual toggle.

This replaces three things in `tmux.conf`:

- `set -g @plugin 'arcticicestudio/nord-tmux'` (line 135) — delete
- `setw -g message-style bg=brightcyan,fg=brightblack` (line 16) — replaced
- `setw -g window-status-activity-style fg='#ADAE38',bg='#282828'` (line 62) — replaced

One plugin fewer, and it matches the "minimal" goal.

### 3.3 Neovim

Your config is Lua, managed by packer, currently on `shaunsingh/nord.nvim`
(`lua/plugins.lua:23`) with `lualine` theme `nord` (`lua/setup/lualine.lua:4`).

Three community ports exist. **`calind/selenized.nvim`** is the pick: it is the
most maintained, covers Tree-sitter, nvim-cmp and GitSigns, and ships a matching
lualine theme.

Swap `lua/plugins.lua`:

```lua
use({
   'calind/selenized.nvim',
   config = get_setup('selenized')
})
```

New `lua/setup/selenized.lua`:

```lua
vim.cmd[[colorscheme selenized]]
```

And `lua/setup/lualine.lua:4` becomes `theme = 'selenized'`.

Then `rm lua/setup/nord.lua`.

**Variant selection.** The plugin reads `vim.o.background`, defaulting to
`dark`. It exposes no `vim.g.selenized_variant` global. Neovim 0.10+ queries the
terminal with OSC 11 and sets `background` from the response, so this should
track Ghostty's light/dark switch on its own.

Verify rather than assume — tmux sits in the middle and may answer the OSC 11
query with its own background instead of forwarding it. Test with:

```
:echo &background
```

in light mode and again in dark mode. If it does not track, set it explicitly
and accept a manual toggle.

### 3.4 Elsewhere

Worth picking up from the upstream repo (`other-apps/`):

- **dircolors** — colors `ls` output to match. Low effort, visible payoff.
- **manpages** — colors `man` output.

Skip the rest; they cover Linux tools you do not run.

---

## 4. What Ghostty gives you over iTerm2, Alacritty, kitty

Ranked by how much each matters given that tmux sits in the middle.

1. **Speed.** Metal renderer, `ReleaseFast` Zig build. Noticeably faster than
   iTerm2 at dumping large output. Agents produce large output constantly.
2. **`toggle_readonly`.** Input lock on a surface. No direct equivalent in
   iTerm2 or kitty. Directly useful for babysitting an agent.
3. **Shell integration with no plugin install.** iTerm2 makes you install a
   script; Ghostty injects it.
4. **`global:` keybindings and the quick terminal.** iTerm2 has a hotkey window.
   Alacritty and kitty do not.
5. **Zero-config correctness.** Full truecolor, correct terminfo, and the kitty
   keyboard protocol — so `ctrl+shift+key`, `ctrl+enter` and similar reach
   programs unambiguously instead of being flattened. No config needed.
6. **Command palette** (`cmd+shift+p`) and **key tables**
   (`activate_key_table`, new in 1.3), which give tmux-style prefix chords at the
   terminal layer. You do not need this. tmux already does it.

Two things it does **not** give you in this setup:

- **Inline images.** Ghostty supports the kitty graphics protocol. tmux does not
  forward it. No inline plots or screenshots inside a session.
- **Useful scrollback search.** See 2.7.

---

## 5. Two bugs in the current tmux config

Independent of Ghostty. Worth fixing either way.

### 5.1 Truecolor is likely broken

`tmux/tmux.conf:10`:

```
set-option -g terminal-overrides "xterm-256color:RGB"
```

Ghostty sets `TERM=xterm-ghostty`. That override never matches, so tmux does not
learn the outer terminal supports 24-bit color. Replace with the tmux 3.2+ form
(you run 3.6a):

```
set -g default-terminal "tmux-256color"
set -as terminal-features ",xterm-ghostty:RGB"
```

### 5.2 `reattach-to-user-namespace` is dead weight

`tmux/tmux.conf:72`:

```
bind v run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"
```

That wrapper has been unnecessary since macOS 10.12. Simplify:

```
bind v run "pbpaste | tmux load-buffer - && tmux paste-buffer"
```

---

## 6. Proposed minimal config

Nine functional lines. Covers the real wins, skips the cosmetics and the
defaults. Everything here is a deliberate departure from a Ghostty default.

```
# ~/.dotfiles/ghostty/config

theme = light:Selenized Light,dark:Selenized Dark
font-size = 14

# tmux owns tabs, splits, history, the window title, and process lifetime.
window-show-tab-bar = never
window-save-state = never
confirm-close-surface = false
shell-integration-features = cursor,no-title,sudo,path

# Meta keys for tmux/zsh/nvim. Use `left` to keep right-option for characters.
macos-option-as-alt = true

# Agent finished, or wants attention.
bell-features = attention,title,border

# Lock the surface so a stray keystroke cannot hit a running agent.
keybind = cmd+shift+r=toggle_readonly
```

Paired tmux changes:

```
set -g default-terminal "tmux-256color"
set -as terminal-features ",xterm-ghostty:RGB"
set -g history-limit 100000
set -g allow-passthrough on
set -g bell-action any
set -g visual-bell off
```

Plus the Selenized status line from §3.2, and the `nord-tmux` plugin removed.

---

## 7. Open decisions

**Settled:** theme is Selenized, light/dark pair.

- [ ] Ligatures on or off
- [ ] `macos-option-as-alt`: `true`, `left`, or drop it
- [ ] `macos-titlebar-style`: `tabs` or `hidden`
- [ ] ssh features: needed on this machine?
- [ ] Quick terminal: want it or not
- [ ] Install Fira Code Nerd Font, or use the bundled JetBrains Mono
- [ ] `Selenized Dark` or `Selenized Black` for the dark half
- [ ] Delete `iterm/` from the repo once Ghostty is settled
- [ ] Pick up dircolors and manpage ports from upstream (§3.4)

## 8. Follow-ups outside Ghostty scope

Noticed while reading the repo. Not blocking, worth queuing for the wider
revamp.

- **packer.nvim is unmaintained.** The author archived it. `lazy.nvim` is the
  successor and is faster to start. Any nvim work should ride on that migration
  rather than fight it.
- **`tmux-resurrect` + `tmux-continuum`** overlap with what a modern setup does
  through a session manager. Revisit when tmux's turn comes.
- **`ignore` at the repo root** duplicates the new `git/ignore`. One of them is
  dead.
