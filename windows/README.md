# Setup and Windows

Are you using Windows?
Unfortunately `@ryanatkn/gro` will not support Windows because I chose Bash instead.

[WSL](https://wikipedia.org/wiki/Windows_Subsystem_for_Linux)
is my recommended way for Windows users to develop. I use it on one of my machines.

- Windows instructions for VSCode: [/vscode](/vscode)

Here's the
[official WSL installation instructions](https://learn.microsoft.com/en-us/windows/wsl/install).
What I had to do:

- in Powershell, type `wsl --install`
- open main windows menu, type "windows features", choose "Turn Windows features on or off"
- check "Windows Hypervisor Platform" and "Windows Subsystem for Linux"
- reboot
- if it doesn't automatically open a prompt to create an Ubuntu user,
  go to Powershell and type `wsl`

## Graceful shutdown

This may be fixed, but for months I would periodically experience
corrupt `.git` directories in my WSL installation,
after numerous reinstallations of WSL and Windows.

Running [off.bat](off.bat) seems to avoid the problem. Maybe Windows is fixed now, idk.

## My preferred options

- Open a folder, click `...` in the title bar, click options, click the `view` tab,
  select `Show hidden files, folders, and drives`, and uncheck `Hide extensions for known file types`,
  then click `OK` or `Apply`.

## Fix to open VSCode from an instance of VSCode

Sometimes I'm unable to open a new instance of VSCode from inside a VSCode terminal.
The error looks like this:

```
Unable to connect to VS Code server: Error in request.
Error: connect ENOENT /run/user/1000/vscode-ipc-[...].sock
[more stuff]
```

From [this VSCode issue](https://github.com/microsoft/vscode/issues/157275):

```bash
loginctl enable-linger $(whoami)
```
