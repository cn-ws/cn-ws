for /f "tokens=*" %%A in ('git describe --abbrev^=4 --always --tags') do set var=%%A
echo '%var%' > cn_ws\version.inc
c:\lazarus\lazbuild.exe cn_ws\cn_ws.lpr
:: strip debug symbols
c:\lazarus\fpc\3.2.0\bin\x86_64-win64\strip.exe cn_ws\cn_ws.exe
echo 'DEVELOP' > cn_ws\version.inc