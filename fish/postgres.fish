if not pgrep -x "postgres" >/dev/null
  sudo pg_ctlcluster 14 main start
end
