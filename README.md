# setup instructions and resources for my dev environment

This repo has docs, configs, and scripts for setting up my dev environment from scratch.

It supports the following software:

- [fish](https://fishshell.com/), the **f**riendly **i**nteractive **sh**ell
- NodeJS: [nodejs.org](https://nodejs.org/)
- [VSCode](https://code.visualstudio.com/) — recommended for
  [its Svelte support](https://github.com/sveltejs/language-tools)
- Svelte: [svelte.dev](https://svelte.dev/) — configured in VSCode
- [Postgres](https://www.postgresql.org/)
- my task runner `@feltcoop/gro`: [github.com/feltcoop/gro](https://github.com/feltcoop/gro)

It's designed for distros with `apt` like Ubuntu for both standalone installations and WSL,
and I'd be happy to take PRs to support other operating systems.

> my bash skills aren't that good! I'd appreciate help improving
> [the script](setup.sh)'s code quality. I think some of it is more verbose than it needs to be.

## instructions

Requirements:

- `apt` like Debian and Ubuntu

**1**. install a browser for development
(I like to develop with [Chromium](https://www.chromium.org/Home))

**2**. install a text editor like [VSCode](https://code.visualstudio.com/),
preferably one with good [Svelte support](https://github.com/sveltejs/language-tools) —
see [the `vscode/` directory](vscode) for recommended extensions and more

**3**. download
[this repo's files](https://github.com/ryanatkn/setup/archive/refs/heads/main.zip)
and run [`setup.sh`](setup.sh):

```bash
wget https://github.com/ryanatkn/setup/archive/refs/heads/main.zip
unzip main.zip
cd setup-main
bash setup.sh
```

and follow the prompts ⚡

> `setup.sh` should be idempotent;
> if you notice a problem running it more than once,
> [bug reports](https://github.com/ryanatkn/setup/issues) are appreciated

**4**. go develop

```bash
git clone git@github.com:yourname/someproject
cd someproject
npm i
# then
c . # alias for `code .`
gg # alias for `gro dev`
```

> learn more about [`@feltcoop/gro`](https://github.com/feltcoop/gro)

## docs

- [`fish/`](fish) — config files that get copied over for fish initialization
- [`vscode/`](vscode) — config files for VSCode (copied over unless they exist)
- [`keyrate/`](keyrate) — speedy keyboard repeat rates
- [`windows/`](windows) — extra steps and notes for Windows users
- [`postgres/`](postgres) — extra steps for Windows WSL users

## license 🐦

public domain ⚘ [The Unlicense](license)
