
1000   REM   LUNAR LANDER 8052-BASIC ADAPTATION BY: S.QUEST - 1978,97
1005   PRINT CHR(27),CHR(91),CHR(50),CHR(74),
1010   PRINT CHR(9),CHR(9),CHR(9),"** APOLLO LUNAR LANDER **"
1020   PRINT CHR(9),CHR(9),CHR(9),"_________1_9_7_8_________"
1030   PRINT
1040   PRINT "ATTENTION:"
1050   PRINT "MISSION CONTROL CALLING APOLLO LUNAR LANDER."
1053   PRINT "ON-BOARD GUIDANCE COMPUTERS HAVE FAILED."
1060   PRINT CHR(7),CHR(7),CHR(7) :  FOR WAI=0 TO 2000 :  NEXT WAI
1065   PRINT "MANUAL LANDING OF THE SPACECRAFT IS REQUIRED!"
1070   PRINT
1075   PRINT "INFORMATION:"
1080   PRINT "   -CAPSULE WEIGHT [33000 LBS]"
1090   PRINT "   -AVAILABLE FUEL [16500 LBS]"
1100   PRINT "   -FREE FALL IMPACT TIME [120 SEC]"
1110   PRINT
1120   PRINT "SET RETRO ROCKET BURN RATE TO ANY VALUE FROM 0 LBS/SEC"
1130   PRINT "(FREE FALL) TO 300 LBS/SEC. TYPE A COMMA AND THEN GIVE"
1140   PRINT "THE DESIRED BURN TIME IN SECONDS."
1150   PRINT "GOOD LUCK!",CHR(7),CHR(7),CHR(7)
1190  A=120
1200  V=1
1210  M=33000.
1220  N=16500
1230  G=.001
1240  Z=1.8
1250  L=0
1260   PRINT  :  PRINT " SEC", TAB (15),"MI + FT", TAB (30),"MPH",
1265   PRINT  TAB (46),"LB FUEL" :  PRINT L, TAB (14),INT(A), TAB (19),
1270   PRINT INT(5280*(A-INT(A))), TAB (29),3600*V, TAB (45),M-N :  PRINT
1280   INPUT "   -ENTER [LBS,SEC] ",K,T
1290   IF M-N<.001 THEN 1400
1300   IF T<.001 THEN 1260
1310  S=T
1320   IF M>=N+S*K THEN 1340
1330  S=(M-N)/K
1340   GOSUB 1790
1350   IF I<=0 THEN 1650
1360   IF V<=0 THEN 1380
1370   IF J<0 THEN 1710
1380   GOSUB 1590
1390   GOTO 1290
1400   PRINT  :  PRINT "OUT OF FUEL AT",L,"SEC."
1410  S=(-V+SQR(V*V+2*A*G))/G
1420  V=V+G*S
1430  L=L+S
1440  W=3600*V
1450   PRINT "ON THE MOON AT:",L,"SEC, IMPACT VELOCITY:",W,"MPH."
1460   IF W>1.2 THEN 1490
1470   PRINT "GREAT LANDING!!!"
1480   GOTO 1830
1490   IF W>10 THEN 1520
1500   PRINT "GOOD LANDING!"
1510   GOTO 1830
1520   IF W>60 THEN 1560
1530   PRINT "SPACECRAFT IS DAMAGED. YOU ARE STRANDED ON THE"
1535   PRINT "MOON UNTIL CONGRESS APPROVES A RESCUE MISSION."
1540   PRINT "WE HOPE YOUR OXYGEN SUPPLY HOLDS OUT!"
1550   GOTO 1830
1560   PRINT "SPACECRAFT CRASHED INTO THE MOON WITH NO SURVIVORS!"
1570   PRINT "IMPACT FORMED A NEW CRATER",W*.2777,"FT IN DIAMETER!"
1580   GOTO 1830
1590  L=L+S
1600  T=T-S
1610  M=M-S*K
1620  A=I
1630  V=J
1640   RETURN
1650   IF S<.005 THEN 1440
1660  D=V+SQR(V*V+2*A*(G-Z*K/M))
1670  S=2*A/D
1680   GOSUB 1790
1690   GOSUB 1590
1700   GOTO 1650
1710  W=(1-M*G/(Z*K))/2
1720  S=M*V/(Z*K*(W+SQR(W*W+V/Z)))+.05
1730   GOSUB 1590
1740   IF I<=0 THEN 1650
1750   GOSUB 1590
1760   IF J>0 THEN 1290
1770   IF V>0 THEN 1710
1780   GOTO 1290
1790  Q=S*K/M
1794   IF Q>.000001 THEN 1800
1796  Q=0
1800  J=V+G*S-Z*Q*(1+Q*(.5+Q*(1/3+Q*(.25+Q/5))))
1810  I=A-G*S*S/2-V*S+Z*S*Q*(.5+Q*(1/6+Q*(1/12+Q/20)))
1820   RETURN
1830   PRINT "END OF SIMULATION."

