# setup and Windows

Are you using Windows?
Unfortunately `@feltjs/gro`
[does not yet support Windows](https://github.com/feltjs/gro/issues/319).

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
- some things in the script didn't set up correctly, like `fnm`, shrug

## not ready - work in progress for Windows 11 support

### installing Node

[fnm](https://github.com/Schniz/fnm) is recommended for managing Node installs.
Its readme has multiple options for installation, or you can follow along my manual instructions:

1. download [the fnm binary](https://github.com/Schniz/fnm/releases) binary
   and put it somewhere it won't get deleted
1. add the binary to your PATH
1. hit the meta/Windows key and search for "environment variables" -
   choose "Edit the system environment variables" and then click the button "Environment Variables..."
1. under "System variables" (or "User variables" if you wish) doubleclick or
   edit "Path" and then "New" and enter the path to the
   **directory** containing the `fnm.exe` binary
   (I'm currently using `C:\windev\bin` to distinguish from my Linux `$HOME/dev` directory)
1. restart your computer or find a shorter path to refreshing your PATH

You should now have `fnm` available as a global in PowerShell.

Next we need to configure our PowerShell profile.
Create the file `C:\Users\YOUR_USER\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
with the contents:

```powershell
fnm env --use-on-cd | Out-String | Invoke-Expression
```

(note the directory is `WindowsPowerShell` -- it seems older
versions of Windows or PowerShell used `PowerShell`)

The profile cannot run by default because Windows 11 disables scripts by default.
At this point, we're introducing a possible attack vector to your system,
and if you don't feel comfortable about running PowerShell scripts on Windows,
please do some research or find another way to install Node.
(I have no idea if I should be scared, but I'm not)

To set the execution policy for the current user, start PowerShell and run:

```powershell
Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
Get-ExecutionPolicy -List
```

You should see the `CurrentUser` is now `Unrestricted`.

Restart PowerShell and you should have `fnm` ready to go!
