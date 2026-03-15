# Tmux Cheatsheet

Prefix: `Ctrl+Space`

## Concepts

- **Session**: A collection of windows. You can detach/reattach to sessions. Think of it as a workspace.
- **Window**: A full-screen tab within a session. Shown in the status bar.
- **Pane**: A split within a window. Multiple panes share the same window.

## Sessions

| Action | Keybinding |
|---|---|
| New session | `tmux new -s name` |
| List sessions | `prefix + s` |
| Rename session | `prefix + $` |
| Detach | `prefix + d` |
| Reattach | `tmux attach -t name` |

## Windows

| Action | Keybinding |
|---|---|
| New window | `prefix + c` |
| Next window | `prefix + n` |
| Previous window | `prefix + p` |
| Select by number | `prefix + 0-9` |
| Rename window | `prefix + ,` |
| Close window | `prefix + &` |

## Panes

| Action | Keybinding |
|---|---|
| Split horizontal | `prefix + "` |
| Split vertical | `prefix + %` |
| Navigate left | `prefix + h` |
| Navigate down | `prefix + j` |
| Navigate up | `prefix + k` |
| Navigate right | `prefix + l` |
| Close pane | `prefix + x` |
| Resize pane | `prefix + Alt+arrow` |
| Toggle zoom (fullscreen) | `prefix + z` |
| Show pane numbers | `prefix + q` |

## Moving & Converting Panes

| Action | Keybinding |
|---|---|
| Swap with next pane | `prefix + }` |
| Swap with previous pane | `prefix + {` |
| Rotate panes | `prefix + Ctrl+o` |
| Cycle layouts | `prefix + Space` |
| Break pane into a new window | `prefix + !` |
| Join a window as a pane | `prefix + :` then `join-pane -s source` |

To move a window into another window as a pane:

```
# From the target window, pull window 2 as a pane
:join-pane -s 2

# Specify horizontal (-h) or vertical (-v) split
:join-pane -h -s 2
```
