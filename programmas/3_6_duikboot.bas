   10 rem *** duikboot ***
   20 rem random :rem dit statement mag vervallen
   30 goto 1800
   40 :
   50 rem *** initialiseren ***
   60 w1 = int(rnd(0) * 90) : rem x-coord. torpedojager
   70 w2 = int(rnd(0) * 90) : rem y-coord. torpedojager
   80 d1 = int(rnd(0) * 90) : rem x-coord. duikroot
   90 d2 = int(rnd(0) * 90) : rem y-coord. duikboot
  100 a = sqr((w1 - d1)^2 + (w2 - d2)^2)
  110 if a < 25 then 60
  120 h3 = 5  :rem heli vol getankt
  130 r = 1   :rem duikboot vaart
  140 z = 9   :rem heli aan boord
  150 c$ = "" :rem lege tekst string
  160 t = 2   :rem aantal torpedo's
  170 e = 1   :rem spel draait
  180 return
  190 :
  200 rem *** invoer ***
  210 print "1 = heli   ";
  220 print "2 = schip  ";
  230 print "3 = torpedo";
  240 print "wat is uw keuze ";
  250 input x
  260 if x < 1 or x > 3 then 210
  270 on x gosub 310 , 430 , 530
  280 return
  290 :
  300 rem *** invoer/verwerking heli ***
  310 if z = 0 then 400
  320 print "geef x,y-coord. heli ";
  330 input h1,h2
  340 if h1 < 0 or h1 > 100 then 310
  350 if h2 < 0 or h2 > 100 then 310
  360 z = 1 :rem heli in de lucht
  370 if h1 <> w1 or h2 <> w2 then 400
  380 h3 = 5 :rem heli wordt bijgetankt
  390 z = 9  :rem heli aan boord
  400 return
  410 :
  420 rem *** invoer/verwerking torpedojager ***
  430 print "geef x,y-coord torpedojager ";
  440 input x,y
  450 if abs(w1 - x) > 5 or abs(w2 - y) > 5 then 430
  460 if x < 0 or x > 100 then 430
  470 if y < 0 or y > 100 then 430
  480 w1 = x
  490 w2 = y
  500 return
  510 :
  520 rem *** invoer / verwerking torpedo ***
  530 print "geef de richting in graden ";
  540 input b
  550 if b < 0 or b > 360 then 530
  560 b = b * 3.1415926 / 180 :rem graden => rad
  570 for i = 1 to 5 step 0.2
  580 : x1 = w1 + cos(b) * i
  590 : x2 = w2 + sin(b) * i
  600 : a = sqr((d1 - x1)^2 + (d2 - x2)^2)
  610 : if a > 5 then 640
  620 : r = 0 :rem duikbroot gezonken
  630 : i = 5 :rem lus-teller maximum
  640 next i
  650 e = 0
  660 t = t - 1 :rem torpedo's min een
  670 if r = 0 or t = 0 then 720
  680 e = 1
  690 rem ** duikboot gevlucht **
  700 d1 = int(rnd(0) * d1 + 1)
  710 d2 = int(rnd(0) * d2 + 1)
  720 return
  730 :
  740 rem *** koers duikboot ***
  750 if e = 0 then 860
  760 d1 = d1 + int(rnd(0) * 3 - 1)
  770 d2 = d2 + int(rnd(0) * 3 - 1)
  780 if d1 > -1 then 800
  790 d1 = 90
  800 if d1 < 91 then 820
  810 d1 = 0
  820 if d2 > -1 then 840
  830 d2 = 90
  840 if d2 < 91 then 860
  850 d2 = 0
  860 return
  870 :
  880 rem *** berekening ***
  890 rem ** helicopter in de lucht **
  900 if z <> 1 or e = 0 then 980
  910 h3 = h3 - 1 :rem brandstof -1
  920 if h3 > -1 then 980
  930 z = 0
  940 c$ = " neergestort !"
  950 h1 = 0
  960 h2 = 0
  970 rem ** plaats helicopter in kaart **
  980 h4 = -1 :rem aanduiding heli
  990 if z <> 1 then 1020
 1000 h4 = int((h2 + 5)/10) * 10 + int((h1 + 5)/10)
 1010 rem ** plaats torpedojager in kaart **
 1020 w4 = int((w2 + 5)/10) * 10 + int((w1 + 5)/10)
 1030 rem ** plaats duikboot in kaart **
 1040 d4 = int((d2 + 5)/10) * 10 + int((d1 + 5)/10)
 1050 d$ = "*" :rem gezonken duikroot
 1060 if r = 0 then 1110
 1070 d$ = "d" :rem varende duikbroot
 1080 if e = 0 then 1110
 1090 d4 = -1  :rem duikboot onzichtbaar
 1100 rem ** afstand tot duikboot **
 1110 h = 0
 1120 if z <> 1 then 1180
 1130 rem * heli - duikboot *
 1140 x = sqr((d1-h1)^2 + (d2-h2)^2)
 1150 gosub 1240
 1160 h = x
 1170 rem * torpedojager - duikboot *
 1180 x = sqr((d1-w1)^2 + (d2-w2)^2)
 1190 gosub 1240
 1200 w = x
 1210 return
 1220 :
 1230 rem *** bepaling mate van nauwkeurigheid ***
 1240 x1 = int(x * 10 + 0.5)/10
 1250 if x < 10 then 1290
 1260 x1 = (int(x/5))*5
 1270 if x1 < 25 then 1290
 1280 x1 = (int(x/10))*10
 1290 x = x1
 1300 return
 1310 :
 1320 rem *** uitvoer ***
 1330 rem cls :rem scherm wissen
 1331 print "{clr}"
 1340 print "*** duikboot ***"
 1350 if z = 9 then 1370
 1360 print "helicopter ";h;tab(17)"coord.x-y";h1;h2;c$
 1370 print "torpedojager";w;tab(17)"coord.x-y";w1;w2
 1380 print "torp.";t
 1390 for j = 0 to 9
 1400 : print tab(j*3+3) j;
 1410 next j
 1420 print " (* 10)"
 1430 for i = 0 to 9
 1440 : print i*10;
 1450 : for j = 0 to 9
 1460 :   p = i*10+j
 1470 :   a$ = "."
 1480 :   if p<>h4 then 1500
 1490 :   a$ = "h"
 1500 :   if p<>w4 then 1520
 1510 :   a$ = "t"
 1520 :   if p<>d4 then 1560
 1530 :   a$ = d$
 1540 :   if p<>w4 or p<>d4 then 1560
 1550 :   a$ = "t" + d$
 1560 :   if p<>w4 or p<>h4 then 1580
 1570 :   a$ = "th"
 1580 :   if p<>h4 or p<>d4 then 1600
 1590 :   a$ = "h" + d$
 1600 :   print tab(j*3+4)a$;
 1610 : next j
 1620 : print
 1630 next i
 1640 return
 1650 :
 1660 rem *** resultaat ***
 1670 rem ** berekening **
 1680 gosub 900
 1690 rem ** uitvoer **
 1700 gosub 1330
 1710 d$ = "verloren, de duikboot vaart nog steeds!"
 1720 if r = 1 then 1740
 1730 d$ = "gewonnen, de duikboot is gezonken!"
 1740 print d$
 1750 print "coordinaten duikboot ";d1;",";d2
 1760 return
 1770 :
 1780 rem **** stuurmodule ****
 1790 rem *** initialiseren ***
 1800 gosub 60
 1810 rem *** berekening ***
 1820 gosub 900
 1830 rem *** uitvoer ***
 1840 gosub 1330
 1850 rem *** invoer ***
 1860 gosub 210
 1870 rem *** koers duikboot ***
 1880 gosub 750
 1890 if e=1 then 1820
 1900 rem *** resultaat ***
 1910 gosub 1680
 1920 end
