:: First shutdown WSL
wsl --shutdown

:: Wait for 5 seconds to allow WSL to properly shutdown
timeout /t 5 /nobreak

:: Shutdown Windows
shutdown /s /t 0