# Setup docs and configs for my dev environment

This repo has docs, configs, and [a bash script](/setup.sh)
for setting up my Ubuntu/Debian dev environment.

It supports the following software:

- [NodeJS](https://nodejs.org/) via [fnm](https://github.com/Schniz/fnm)
- [fish](https://fishshell.com/) shell
- [Postgres](https://www.postgresql.org/)
- [VSCode](https://code.visualstudio.com/) — recommended for
  [its Svelte support](https://github.com/sveltejs/language-tools):
  - [Svelte](https://svelte.dev/)
  - [ESLint](https://eslint.org/)
  - [Prettier](https://prettier.io/)
- my task runner and toolkit `@ryanatkn/gro`: [github.com/ryanatkn/gro](https://github.com/ryanatkn/gro)

It's designed for distros with `apt` like Ubuntu for both standalone installations and WSL.

> ⚠️ This seems to be failing badly on WSL now, idk what's wrong.

## Docs

- [instructions](#instructions) (see below)
- [`fish/`](fish) — config files that get copied over for fish initialization
- [`vscode/`](vscode) — settings, snippets, and keybindings for VSCode
  (copied over by the script unless they exist or the paths aren't right)
- [`keyrate/`](keyrate) — speedy keyboard repeat rates
- [`windows/`](windows) — extra steps and notes for Windows users

## Instructions

Requirements:

- [apt](<https://wikipedia.org/wiki/APT_(software)>) like Debian and Ubuntu

**1. Install a browser and git** for development

**2. Install a text editor** (with good [Svelte support](https://github.com/sveltejs/language-tools) if you need it)
like [VSCode](https://code.visualstudio.com/) —
see [the `vscode/` directory](vscode) for recommended extensions and docs/config

**3. Download [this repo's files 📁](https://github.com/ryanatkn/setup/archive/refs/heads/main.zip)**
and run [`setup.sh`](/setup.sh):

```bash
git clone https://github.com/ryanatkn/setup
cd setup
bash setup.sh
```

and follow the prompts ⚡

> `setup.sh` should be [idempotent](https://wikipedia.org/wiki/Idempotence#Computer_science_meaning);
> if you notice a problem running it more than once,
> [bug reports](https://github.com/ryanatkn/setup/issues) are appreciated

**4. Log out and back in** to update your shell, or reboot for good measure

**5. Go develop**

```bash
ssh-keygen # follow prompts and add `~/.ssh/id_rsa.pub` to GitHub via settings -> SSH and GPG keys
cd ~/dev # currently hardcoded in script
git clone git@github.com:yourname/someproject
cd someproject
npm i
# then
c . # alias for `code .`
gg # alias for `gro dev`
```

> learn more about [`@ryanatkn/gro`](https://github.com/ryanatkn/gro)

## Todo

- improve the bash script so the authors look like they know what they're doing
- consider renaming this repo from `setup` to something less generic,
  maybe I should give in to `dotfiles`

## License 🐦

public domain ⚘ [The Unlicense](license)
