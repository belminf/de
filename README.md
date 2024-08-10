# de

My sway based desktop environment.

## Setup

Makefile should install packages and setup DE:

```bash
make install
```

## Keyboard shortcuts

Without leader key:

- <kbd>Shift</kbd><kbd>F11</kbd>: Launch audio configuration
- <kbd>Shift</kbd><kbd>F12</kbd>: Launch WiFi configuration

With leader key (<kbd>R-Window</kbd>):

- General:
  - <kbd>Space</kbd>: Start launcher for desktop apps
  - <kbd>Shift</kbd><kbd>R</kbd>: Restart and reload config
  - <kbd>End</kbd>: Bring up power menu (i.e., shutdown and restart)
  - <kbd>Q</kbd>: Quit window
  - <kbd>P</kbd>: Launch clipboard manager
- Application shortcuts:
  - <kbd>Enter</kbd>: Launch tmux (terminal)
  - <kbd>Backspace</kbd>: Launch browser
  - <kbd>N</kbd>: Launch Standard Notes
- Screenshot:
  - <kbd>Print</kbd>: Save in clipboard
  - <kbd>Shift</kbd><kbd>Print</kbd>: Save in ~/screenshots
- Workspace movement:
  - <kbd>\`</kbd> (Lever): Cycle workspaces in current display
  - <kbd>Ctrl</kbd><kbd>&uparrow;</kbd>: Switch to next workspace on display
  - <kbd>Ctrl</kbd><kbd>&downarrow;</kbd>: Switch to previous workspace on display
  - <kbd>Ctrl</kbd><kbd>&leftarrow;</kbd>: Switch to display on the left
  - <kbd>Ctrl</kbd><kbd>&rightarrow;</kbd>: Switch to display on the right
  - <kbd>Shift</kbd><kbd>\`</kbd>: Move window to a new workspace
  - <kbd>Alt</kbd><kbd>&uparrow;</kbd>: Move current workspace to display above
  - <kbd>Alt</kbd><kbd>&downarrow;</kbd>: Move current workspace to the right
  - <kbd>(Workspace Number)</kbd>: Move focus to a workspace
- Window layout:
  - <kbd>Shift</kbd><kbd>\\</kbd> (`|`): Split horizontal
  - <kbd>Shift</kbd><kbd>-</kbd> (`_`): Split vertical
- Window focus:
  - <kbd>Tab</kbd>: Toggle floating for current window
  - <kbd>Shift</kbd><kbd>Tab</kbd>: Toggle focus between floating and tiled windows
  - <kbd>L</kbd>/<kbd>&rightarrow;</kbd>: Focus window on right
  - <kbd>H</kbd>/<kbd>&leftarrow;</kbd>: Focus window on left
  - <kbd>J</kbd>/<kbd>&downarrow;</kbd>: Focus window below
  - <kbd>K</kbd>/<kbd>&uparrow;</kbd>: Focus window above
- Window movement:
  - <kbd>Shift</kbd><kbd>&leftarrow;</kbd>: Move current window left
  - <kbd>Shift</kbd><kbd>&rightarrow;</kbd>: Move current window right
  - <kbd>Shift</kbd><kbd>&downarrow;</kbd>: Move current window down
  - <kbd>Shift</kbd><kbd>&uparrow;</kbd>: Move current window up
  - <kbd>Shift</kbd><kbd>(Workspace Number)</kbd>: Move current window to a workspace
- Window resizing:
  - <kbd>R</kbd>: Enable resize mode
  - <kbd>&leftarrow;</kbd>: Shrink window width
  - <kbd>&rightarrow;</kbd>: Grow window width
  - <kbd>&downarrow;</kbd>: Shrink window height
  - <kbd>&uparrow;</kbd>: Grow window height

# Troubleshooting

## Keyboard mapping

```bash
# To test
sudo keyd reload; sudo systemctl status keyd
```
