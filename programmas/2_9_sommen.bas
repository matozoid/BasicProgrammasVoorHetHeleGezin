   10 rem *** sommen ****
   20 dim a$(4)
   30 rem random :rem dit statement kan men weglaten
   40 goto 1280
   50 :
   60 rem *** initialiseren ***
   70 a$(1) = "+"
   80 a$(2) = "-"
   90 a$(3) = "*"
  100 a$(4) = ":"
  110 t = 0 :rem reurtteller
  120 n = 1 :rem niveau
  130 p = 0 :rem niveauindikator
  140 y = 0 :rem perc.goeden
  150 g = 0 :rem goede antwoorden
  160 return
  170 :
  180 rem *** uitvoer ***
  190 rem cls :rem scherm wissen
  191 print"{clr}"
  200 print "*** sommen ***"
  210 print "beurt        :";t
  220 print "niveau       :";n
  230 print "perc. goeden :";y
  240 print
  250 on k gosub 300 ,340
  260 print
  270 return
  280 :
  290 rem *** print regel k = 1 ***
  300 print a; a$(j);b;"= .."
  310 return
  320 :
  330 rem *** print regel k = 2 ***
  340 print a;a$(j);" .. = ";b
  350 return
  360 :
  370 rem *** getallen trekken ***
  380 a = int(rnd(0) * x + 1)
  390 b = int(rnd(0) * x + 1)
  400 return
  410 :
  420 rem *** vraag ophalen ***
  430 n = int(p/5 + 1)
  440 if n < 9 then 460
  450 n = 8
  460 j = n
  470 if j < 5 then 490
  480 j = 4
  490 j = int(rnd(0) * j + 1)
  500 on j gosub 590 ,650 ,730 ,820
  510 k = int(rnd(0) * 2 +1)
  520 if k = 1 then 560
  530 h = b
  540 b = c
  550 c = h
  560 return
  570 :
  580 rem *** optellen ***
  590 x = int(n/2 + 1) * 10
  600 gosub 380
  610 c= a + b
  620 return
  630 :
  640 rem *** aftrekken ***
  650 x = int(n/2 + 1) * 10
  660 gosub 380
  670 c = a + b
  680 a = c
  690 c = a - b
  700 return
  710 :
  720 rem *** vermenigvuldigen ***
  730 x= 10
  740 if n < 5 then 760
  750 x = x + n
  760 gosub 380
  770 if a > 10 or b > 10 then 760
  780 c = a * b
  790 return
  800 :
  810 rem *** delen ***
  820 x = 10
  830 if n < 5 then 850
  840 x = x + n
  850 gosub 380
  860 if a > 10 or b > 10 then 850
  870 c = a * b
  880 a = c
  890 c = a/b
  900 return
  910 :
  920 rem *** invoer ***
  930 print "stop = -9 !"
  940 print "wat moet er ingevuld worden ";
  950 input q
  960 if q = -9 then 1140
  970 t = t + 1
  980 p = p - 1
  990 h = 0
 1000 a$ = "=> fout <="
 1010 if q <> c then 1060
 1020 a$ = "=> goed <="
 1030 h = 1
 1040 g = g + 1
 1050 p = p + 2
 1060 if p > 0 then 1080
 1070 p = 1
 1080 y = int((g/t) * 1000)/10
 1090 print tab(10) a$
 1100 print "het antwoord was ";c
 1110 rem ** wachtlus **
 1120 for i = 1 to 250 * (2 - h)
 1130 next i
 1140 return
 1150 :
 1160 rem *** resultaat ***
 1170 rem cls :rem scherm wissen
 1171 print"{clr}"
 1180 print "*** sommen ***"
 1190 print
 1200 print "totaal aantal beurten  : ";t
 1210 print "totaal aantal goeden   : ";g
 1220 print "perc. goede antwoorden : ";y
 1230 print "niveau                 : ";n
 1240 return
 1250 :
 1260 rem **** stuurmodule ****
 1270 rem *** initialiseren ***
 1280 gosub 70
 1290 rem *** vraag ophalen ***
 1300 gosub 430
 1310 rem *** uitvoer ***
 1320 gosub 190
 1330 rem *** invoer ***
 1340 gosub 930
 1350 if q <> -9 then 1300
 1360 rem *** resultaat ***
 1370 gosub 1170
 1380 end
