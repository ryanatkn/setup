# setup VSCode docs

I recommend VSCode for its Svelte support.
YMMV with other editors.

## recommended VSCode extensions

- [Svelte for VS Code](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)


## VSCode with Windows and WSL

When using WSL and Windows, you may want to run VSCode in your Windows host instead of in Linux.
If this is the case, [`setup.sh`](/setup.sh) will try to copy over VSCode settings,
but they won't be used by your editor.
You can manually copy the config files:

- [keybindings.json](/vscode/keybindings.json) —
  press `ctrl+shift+p`, `Preferences: Open Keyboard Shortcuts (JSON)`
- [settings.json](/vscode/settings.json) —
  press `ctrl+shift+p`, `Preferences: Open Settings (JSON)`
- [snips.code-snippets](/vscode/snips.code-snippets) —
  press `ctrl+shift+p`, `Preferences: Configure User Snippets`, `New Global Snippets file...`

> TODO automated solution for configuring VSCode in Windows?


## Svelte snippets

- `nc` - new Svelte component
- `ncc` - new Svelte component with children
- `snip` - new Svelte snippet
- `if` - Svelte if block
- `else` - Svelte if/else block
- `render` - Svelte render block
- `btn` - HTML button

> TODO improve these docs

## Resources

- [VSCode keyboard shortcuts for Linux](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)
