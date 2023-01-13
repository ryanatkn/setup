# setup instructions and resources for my dev environment

This repo has docs, configs, and [a bash script](setup.sh)
for setting up my dev environment from scratch.

Current limitations:

- requires [apt](<https://wikipedia.org/wiki/APT_(software)>)
  like Debian and Ubuntu ([issue #4](https://github.com/ryanatkn/setup/issues/4))
- no macOS support because it requires apt ([issue #3](https://github.com/ryanatkn/setup/issues/3))

It supports the following software:

- NodeJS: [nodejs.org](https://nodejs.org/) via [fnm](https://github.com/Schniz/fnm)
- configured in [VSCode](https://code.visualstudio.com/) — recommended for
  [its Svelte support](https://github.com/sveltejs/language-tools):
  - [Svelte](https://svelte.dev/)
  - [ESLint](https://eslint.org/)
  - [Prettier](https://prettier.io/)
- [Postgres](https://www.postgresql.org/)
- my task runner and toolkit `@feltcoop/gro`: [github.com/feltcoop/gro](https://github.com/feltcoop/gro)
- [fish](https://fishshell.com/), the **f**riendly **i**nteractive **sh**ell

It's designed for distros with apt like Ubuntu for both standalone installations and WSL,
and I'd be happy to take PRs to support other operating systems
like apt-less Linux distros ([issue #4](https://github.com/ryanatkn/setup/issues/4))
and macOS ([issue #3](https://github.com/ryanatkn/setup/issues/3)).

> my bash skills aren't that good! I'd appreciate help improving
> [the script](setup.sh)'s code quality. I think some of it is more verbose than it needs to be.

## docs

- [instructions](#instructions) (see below)
- [`fish/`](fish) — config files that get copied over for fish initialization
- [`vscode/`](vscode) — config files for VSCode (copied over unless they exist)
- [`keyrate/`](keyrate) — speedy keyboard repeat rates
- [`windows/`](windows) — extra steps and notes for Windows users
- [`postgres/`](postgres) — extra steps for Windows WSL users

## instructions

Requirements:

- [apt](<https://wikipedia.org/wiki/APT_(software)>) like Debian and Ubuntu

**1. install a browser** for development
(I like to develop with [Chromium](https://www.chromium.org/Home))

**2. install a text editor** like [VSCode](https://code.visualstudio.com/),
preferably one with good [Svelte support](https://github.com/sveltejs/language-tools) —
see [the `vscode/` directory](vscode) for recommended extensions and more

**3. download [this repo's files 📁](https://github.com/ryanatkn/setup/archive/refs/heads/main.zip)**
and run [`setup.sh`](setup.sh):

```bash
wget https://github.com/ryanatkn/setup/archive/refs/heads/main.zip
unzip main.zip
cd setup-main
bash setup.sh
```

and follow the prompts ⚡

> `setup.sh` should be [idempotent](https://wikipedia.org/wiki/Idempotence#Computer_science_meaning);
> if you notice a problem running it more than once,
> [bug reports](https://github.com/ryanatkn/setup/issues) are appreciated

**4. log out and back in** to update your shell, or reboot for good measure

**5. go develop**

```bash
cd ~/dev # currently hardcoded in script
git clone git@github.com:yourname/someproject
cd someproject
npm i
# then
c . # alias for `code .`
gg # alias for `gro dev`
```

> learn more about [`@feltcoop/gro`](https://github.com/feltcoop/gro)

## todo

- improve the bash script so the authors look like they know what they're doing
- consider renaming this repo from `setup` to something less generic

## license 🐦

public domain ⚘ [The Unlicense](license)
