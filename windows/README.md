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

## new instructions!

### installing Node

[fnm](https://github.com/Schniz/fnm) is recommended for managing Node installs.
The repo has multiple options for installation, or you can follow along my manual instructions:

1. download [the fnm binary](https://github.com/Schniz/fnm/releases) binary
  and put it somewhere it won't get deleted
1. add the binary to your PATH
  1. hit the meta/Windows key and search for "environment variables" -
    choose "edit the system environment variables"
  1. under "System variables" (or "User variables" if you wish) doubleclick or
    edit "Path" and then "New" and enter the path to the `fnm.exe` binary
    (you can right-click the binary and click "Copy as path" and paste the string in)
  1. restart your computer or find a shorter path to refreshing your PATH
