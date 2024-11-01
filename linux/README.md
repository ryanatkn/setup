# Linux setup

## ctrl+shift+e in VSCode

Gnome interferes with VSCode on some systems by default.
To fix this, run `ibus-setup` and remove the emoji shortcuts.

## Remap touchpad middle click

```bash
xinput list
# find touchpad id, e.g. 9:
xinput set-button-map 9 1 1 3
```
