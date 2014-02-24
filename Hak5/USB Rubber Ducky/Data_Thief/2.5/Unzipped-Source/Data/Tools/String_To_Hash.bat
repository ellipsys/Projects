@echo off
:start
Title = String to hash converter
set string=
set string_hash=
set /p string=String: %=%
@echo Converting to hash...
set string_hash=%string%
set string_hash=%string_hash:#=94%
set string_hash=%string_hash:A=+3%"
set string_hash=%string_hash:B=+5%"
set string_hash=%string_hash:C=+7%"
set string_hash=%string_hash:D=+6%"
set string_hash=%string_hash:E=+9%"
set string_hash=%string_hash:F=+13%"
set string_hash=%string_hash:G=+12%"
set string_hash=%string_hash:H=+11%"
set string_hash=%string_hash:I=+4%"
set string_hash=%string_hash:J=+24%"
set string_hash=%string_hash:K=+20%"
set string_hash=%string_hash:L=+34%"
set string_hash=%string_hash:M=+29%"
set string_hash=%string_hash:N=+81%"
set string_hash=%string_hash:O=+83%"
set string_hash=%string_hash:P=+33%"
set string_hash=%string_hash:Q=+78%"
set string_hash=%string_hash:R=+42%"
set string_hash=%string_hash:S=+97%"
set string_hash=%string_hash:T=+72%"
set string_hash=%string_hash:U=+49%"
set string_hash=%string_hash:V=+102%"
set string_hash=%string_hash:W=+247%"
set string_hash=%string_hash:X=+92%"
set string_hash=%string_hash:Y=+30%"
set string_hash=%string_hash:Z=+4%"
set /a string_hash=0%string_hash%
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%+1172
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%*24
set string_hash=%string_hash:1=QQ%
set string_hash=%string_hash:2=RQ%
set string_hash=%string_hash:3=WR%
set string_hash=%string_hash:4=Q#%
set string_hash=%string_hash:5=DA%
set string_hash=%string_hash:6=AX%
set string_hash=%string_hash:7=LPD%
set string_hash=%string_hash:8=PA%
set string_hash=%string_hash:9=CZS%
set string_hash=%string_hash%
set string_hash2=%string_hash%
set string_hash=%string_hash:#=94%
set string_hash=%string_hash:A=+3%"
set string_hash=%string_hash:B=+5%"
set string_hash=%string_hash:C=+7%"
set string_hash=%string_hash:D=+6%"
set string_hash=%string_hash:E=+9%"
set string_hash=%string_hash:F=+13%"
set string_hash=%string_hash:G=+12%"
set string_hash=%string_hash:H=+11%"
set string_hash=%string_hash:I=+4%"
set string_hash=%string_hash:J=+24%"
set string_hash=%string_hash:K=+20%"
set string_hash=%string_hash:L=+34%"
set string_hash=%string_hash:M=+29%"
set string_hash=%string_hash:N=+81%"
set string_hash=%string_hash:O=+83%"
set string_hash=%string_hash:P=+33%"
set string_hash=%string_hash:Q=+78%"
set string_hash=%string_hash:R=+42%"
set string_hash=%string_hash:S=+97%"
set string_hash=%string_hash:T=+72%"
set string_hash=%string_hash:U=+49%"
set string_hash=%string_hash:V=+102%"
set string_hash=%string_hash:W=+247%"
set string_hash=%string_hash:X=+92%"
set string_hash=%string_hash:Y=+30%"
set string_hash=%string_hash:Z=+4%"
set /a string_hash=0%string_hash%
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%+1172
set /a string_hash=%string_hash%+992132
set string_hash2=%string_hash2:-=%
set string_hash=%string_hash%%string_hash2%
set string_hash=%string_hash:1=QQ%
set string_hash=%string_hash:2=RQ%
set string_hash=%string_hash:3=WR%
set string_hash=%string_hash:4=Q#%
set string_hash=%string_hash:5=DA%
set string_hash=%string_hash:6=AX%
set string_hash=%string_hash:7=LPD%
set string_hash=%string_hash:8=PA%
set string_hash=%string_hash:9=CZS%
set string_hash=%string_hash:A=#%
set string_hash=%string_hash:C=8%
set string_hash=%string_hash:D=8%
set string_hash=%string_hash:F=9%
set string_hash=%string_hash:H=2#%
set string_hash=%string_hash:J=9#%
echo %string_hash%
goto start
