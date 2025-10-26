   10 rem *** vleugel profiel ***
   20 dim a(25,3), b(25,3)
   30 goto 1360
   40 :
   50 rem *** inititialiseren ****
   60 for i = 1 to 25
   70 : for j = 1 to 3
   80 :   a(i,j) = 0
   90 : next j
  100 next i
  110 t = 0
  120 return
  130 :
  140 rem *** invoer ***
  150 for i = 1 to 25
  160 : if (i-1)/3 - int((i-1)/3) <> 0 then 210
  170 : rem ** kop afdrukken **
  180 : gosub 1020
  190 : print
  200 : rem ** input-blok **
  210 : x = i
  220 : gosub 1080
  230 : if h <> 0 then 260
  240 : t = i
  250 : i = 25 :rem lus-teller op maximum
  260 next i
  270 if t <> 0 then 290
  280 t = 25
  290 return
  300 :
  310 rem *** lengte profiel ***
  320 rem ** kop afdrukken **
  330 gosub 1020
  340 print "geef de lengte in millimeters waarop"
  350 print "het profiel moet worden uitgezet."
  360 print "<stop = 0> hoeveel millimeter ";
  370 input m
  380 if m < 0 then 340
  390 return
  400 :
  410 rem *** correctie-routine ***
  420 rem ** kop afdrukken **
  430 gosub 1020
  440 print "welke regel wijzigen <stop = 0> ";
  450 input x
  460 if x = 0 then 570
  470 if x < 0 or x > t then 440
  480 print "opgenomen gegevens"
  490 print "regel .......";x
  500 print "% vanaf neus ";a(x,1)
  510 print "% bovenzijde ";a(x,2)
  520 print "% onderzijde ";a(x,3)
  530 print "indien u niet wilt wijzigen toets bij de"
  540 print "eerste vraag -9 + <return> "
  550 rem ** input-blok **
  560 gosub 1080
  570 return
  580 :
  590 rem *** bewerking ***
  600 for i = 1 to t
  610 : for j = 1 to 3
  620 :   b(i,j ) = m * a(i,j)/100 :rem maat bepalen
  630 :   b(i,j) = int(b(i,j) * 10 + 0.5)/10 :rem afronden
  640 : next j
  650 next i
  660 return
  670 :
  680 rem *** uitvoer ***
  690 for i = 1 to t
  700 : if (i-1)/5 - int((i-1)/5) <> 0 then 810
  710 : if i = 1 then 760
  720 : rem ** wachten **
  730 : gosub 1250
  740 : if h = 0 then 990
  750 : rem ** kop afdrukken ***
  760 : gosub 1020
  770 : print "profiel uitgezet op ";m;"mm."
  780 : print "maten in millimeters !"
  790 : print
  800 : print "vanaf neus bovenzijde onderzijde"
  810 : for j = 1 to 3
  820 :   a$ = "0.0"
  830 :   if b(i,j) = 0 then 920
  840 :   b$ = "0"
  850 :   if int(b(i,j)) < 0.001 then 870
  860 :   b$ = ""
  870 :   a$ = str$(b(i,j)) :rem numeriek => alfa
  880 :   a$ = right$(a$,len(a$)-1)
  890 :   c$ = right$(a$,2)
  900 :   if left$(c$,1) = "." then 920
  910 :   a$ = a$ + ".0"
  920 :   a$ = b$ + a$
  930 :   l = 10 - len(a$)
  940 :   print tab((j-1) * 12 + l)a$;
  950 : next j
  960 : print
  970 next i
  980 gosub 1250 :rem ** wachten **
  990 return
 1000 :
 1010 rem *** kop afdrukken ***
 1020 rem cls :rem scherm wissen
 1021 print"{clr}"
 1030 print "*** vleugelprofiel ***"
 1040 print
 1050 return
 1060 :
 1070 rem **** input blok ***
 1080 h = 0
 1090 print x;"geef % vanaf neus profiel ";
 1100 input a
 1110 if a = -9 and t <> 0 then 1220
 1120 if a > 100 then 1090
 1130 a(x,1) = a
 1140 if a = 100 then 1160
 1150 h = 1
 1160 print x;"geef % bovenzijde ";
 1170 input a(x,2)
 1180 print x;"geef % onderzijde ";
 1190 input a(x,3)
 1200 if a(x,2) < a(x,3) then 1160
 1210 print
 1220 return
 1230 :
 1240 rem *** wachten ***
 1250 print "wilt u doorgaan <ja/nee> ";
 1260 input a$
 1270 a$ = left$(a$,1)
 1280 h = 0 :rem stuurvariabele
 1290 if a$ = "n" then 1320
 1300 h = 1
 1310 if a$ <> "j" then 1250
 1320 return
 1330 :
 1340 rem **** stuurmodule ****
 1350 rem *** initialiseren ****
 1360 gosub 60
 1370 rem *** invoer ***
 1380 gosub 150
 1390 rem *** correctie ***
 1400 gosub 430
 1410 if x <> 0 then 1400
 1420 rem *** lengte profiel ***
 1430 gosub 330
 1440 if m = 0 then 1500
 1450 rem *** berekening ***
 1460 gosub 600
 1470 rem *** uitvoer ***
 1480 gosub 690
 1490 if h = 1 then 1430
 1500 end
