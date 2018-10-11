@echo off

echo Agarde un intre, o proceso esta en marcha.

tracert www.wikivoyage.org >> %USERPROFILE%\Desktop\LOG_R.txt
echo **** 10.0.129.217 **** >> %USERPROFILE%\Desktop\LOG_R.txt
echo 5

tracert www.mediawiki.org >> %USERPROFILE%\Desktop\LOG_R.txt
echo **** 10.0.129.224 **** >> %USERPROFILE%\Desktop\LOG_R.txt
echo 4

tracert www.wikimedia.org >> %USERPROFILE%\Desktop\LOG_R.txt
echo **** 10.0.129.227 **** >> %USERPROFILE%\Desktop\LOG_R.txt
echo 3

tracert www.wikidata.org >> %USERPROFILE%\Desktop\LOG_R.txt
echo **** 10.0.129.229 **** >> %USERPROFILE%\Desktop\LOG_R.txt
echo 2

tracert www.wikipedia.org >> %USERPROFILE%\Desktop\LOG_R.txt
echo **** 10.0.129.249 **** >> %USERPROFILE%\Desktop\LOG_R.txt
echo 1

date /t >> %USERPROFILE%\Desktop\LOG_R.txt
time /t  >> %USERPROFILE%\Desktop\LOG_R.txt
echo  >> %USERPROFILE%\Desktop\LOG_R.txt

echo Proceso rematado, pode ver o resultado no log que se creou no seu escritorio chamado R.txt

pause
