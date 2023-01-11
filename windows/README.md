# setup and Windows

Are you using Windows?
Unfortunately `@feltcoop/gro`
[does not yet support Windows](https://github.com/feltcoop/gro/issues/319).

[WSL](https://wikipedia.org/wiki/Windows_Subsystem_for_Linux)
is my recommended way for Windows users to develop. I use it on one of my machines.
(TODO video walkthrough)

- Windows instructions for VSCode: [/vscode](/vscode)
- Windows instructions for Postgres: [/postgres](/postgres)

WSL starts with Bash by default, so `chsh` doesn't work as expected.
To start with Fish, create a new shortcut (rightclick the desktop -> New -> Shortcut)
with the following contents: `%systemroot%\system32\bash -c /usr/bin/fish`
