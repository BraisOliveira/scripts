schtasks /create /ru / system /rl highest /sc DAILY /tn Reboot /tr "shutdown /r /f /t 60 /c "Reboot"" /st 23:59 /F

REM /ru system -> run by system user
REM /rl -> run with highest privileges
REM /sc DAILY -> run everyday
REM /tn Reboot -> task name (watch in taskschd.msc)
REM /tr ... -> command
REM /shutdown /r -> reboot
REM /f -> force, close open apps
REM /t 60 -> courtesy timeout 1min 
REM /c "Reboot"" -> task name
REM /st 23:59 -> time for trigger
REM /F -> if exists, overwrite task