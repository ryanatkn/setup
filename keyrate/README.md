# setup keyrate setup

Once I started using a rapid keyboard repeat rate,
I could never go back to the defaults offered on most operating systems.
Some OSes have settings to make the repeat rate ultra fast, but many do not.

By default, [the setup script](/setup.sh)
adds [a fish config file](/fish/settings.fish)
that detects the `xset` command,
and if it's available it'll set the default repeat rate
(the time between automatic keypresses when you hold down a key)
and the repeat delay (the time between an initial press and the first repeat)
to my preferred values. (maybe they could be tweaked?)

You can edit [the fish settings file](/fish/settings.fish) before running the setup script,
or you can edit it afterwards at `~/.config/fish/conf.d/settings.fish`.
If you don't have `xset` installed by default, here are some options:

## alternatives to `xset`

Some OSes like Windows have neither `xset` nor sufficiently fast keyboard repeat rate settings,
but all is not lost:

### Windows

See [this Stackoverflow answer](https://stackoverflow.com/questions/171326/how-can-i-increase-the-key-repeat-rate-beyond-the-oss-limit/11056655#11056655)
which links to `keyrate.exe` hosted [here on GitHub](https://github.com/EricTetz/keyrate).
See that project's releases, and here's [my build](./keyrate.exe).
(it's public domain and easily compiled from source, e.g.
`.\zig.exe cc -Os -o keyrate.exe ..\keyrate\keyrate.c`)

> **Like all `.exe`s these should be treated as hazardous**.
> I verified the code before compiling [my build](./keyrate.exe) but nothing more sophisticated.

Example usage:

- copy `keyrate.exe` to `C:\keyrate.exe`
- create `keyrate.bat` (or some other name) with the contents `C:\keyrate.exe 180 6`
  or whatever path and settings you prefer
- [press `WindowsKey+R`](https://stackoverflow.com/questions/21218346/run-batch-file-on-start-up/54328347#54328347),
  enter `shell:startup`,
  and move the `keyrate.bat` you created into the folder that appears

### macOS

I haven't verified it works, but
[the above Stackoverflow post mentioned for Windows](<(https://stackoverflow.com/questions/171326/how-can-i-increase-the-key-repeat-rate-beyond-the-oss-limit/11056655#11056655)>)
also contains [this answer for macOS](https://stackoverflow.com/a/429465).
