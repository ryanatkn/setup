# setup Postgres docs

The setup script asks you if you want to install Postgres — feel free to say yes!
However there's a caveat for Windows users:

## Windows WSL Postgres users

`systemctl` and systemd [aren't yet supported by WSL](https://github.com/microsoft/WSL/issues/994)
at the time this was written,
so WSL users have to jump through some extra hoops to make Postgres start automatically.

The command to start the current version of Postgres is `sudo pg_ctlcluster 14 main start`.
The setup script adds [postgres.fish](/fish/postgres.fish)
to fish's `~/.config/fish/conf.d/` if you opt into Postgres,
and on shell startup it runs the `pg_ctlcluster` command if no "postgres" process is found.

However this requires the user to enter their password when the shell initializes.
To bypass this annoyance, and **open a potential security vulnerability**
(I don't know how much of a problem this is, pls help), create this file:

```
sudo visudo -f /etc/sudoers.d/bypass_sudo_pg
```

with the contents:

```
%sudo ALL=(ALL) NOPASSWD:/usr/bin/pg_ctlcluster
```

In my testing this makes WSL work almost seamlessly with Postgres.
I see a "stale PID" message that goes away when I hit the enter key (ツ)
