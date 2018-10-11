@echo off

echo Agarde un intre, o proceso esta en marcha.

tracert www.wikivoyage.org >> C:\Users\B\Desktop\R.txt
echo **** 10.0.129.217 **** >> C:\Users\B\Desktop\R.txt
echo 5

tracert www.mediawiki.org >> C:\Users\B\Desktop\R.txt
echo **** 10.0.129.224 **** >> C:\Users\B\Desktop\R.txt
echo 4

tracert www.wikimedia.org >> C:\Users\B\Desktop\R.txt
echo **** 10.0.129.227 **** >> C:\Users\B\Desktop\R.txt
echo 3

tracert www.wikidata.org >> C:\Users\B\Desktop\R.txt
echo **** 10.0.129.229 **** >> C:\Users\B\Desktop\R.txt
echo 2

tracert www.wikipedia.org >> C:\Users\B\Desktop\R.txt
echo **** 10.0.129.249 **** >> C:\Users\B\Desktop\R.txt
echo 1

date /t >> C:\Users\B\Desktop\R.txt
time /t  >> C:\Users\B\Desktop\R.txt
echo  >> C:\Users\B\Desktop\R.txt
echo Proceso rematado, pode ver o resultado no log que se creou no seu escritorio chamado R.txt

pause
