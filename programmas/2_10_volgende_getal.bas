   10 rem *** wat is het volgende getal ***
   20 rem random :rem dit statement mag vervallen
   30 dim a(7)
   40 goto 1270
   50 :
   60 rem *** initialiseren ***
   70 t = 0 :rem aantal beurten
   80 g = 0 :rem aantal goede antw.
   90 y = 0 :rem perc. goeden
  100 p = 0 :rem niveau-indicator
  110 n = 1 :rem niveau
  120 return
  130 :
  140 rem *** oplopend niveau <= 1 ***
  150 for i = 1 to 7
  160 : a(i) = b + r * i
  170 next i
  180 return
  190 :
  200 rem *** afdalend niveau <= 2 ***
  210 gosub 150 :rem oplopend
  220 for i = 1 to 3
  230 : a = a(8-i)
  240 : a(8-i) = a(i)
  250 : a(i) = a
  260 next i
  270 return
  280 :
  290 rem *** twee reeksen ***
  300 rem niveau <= 3 en niveau <= 4
  310 for j = 1 to 2
  320 : b = int(rnd(0) * x + 1)
  330 : r = int(rnd(0) * z + 1)
  340 : if rnd(0) > 0.5 or n = 3 then 360
  350 : r = r * -1
  360 : gosub 410
  370 next j
  380 return
  390 :
  400 rem *** oplopend met stapgrootte 2 ***
  410 s = b
  420 for i = j to 8 - j step 2
  430 : a(i) = s + r
  440 : s = a(i)
  450 next i
  460 return
  470 :
  480 rem *** random gevuld 1 niveau <= 5 ***
  490 for i = 1 to 6
  500 : a(i) = int(rnd(0) * x + 1)
  510 next i
  520 j = 1
  530 gosub 410
  540 return
  550 :
  560 rem *** random gevuld niveau <= 6 ***
  570 h = int(rnd(0) * 2 + 1) :rem oplopend/afdalend ?
  580 on h gosub 150 ,210
  590 q = int(rnd(0) * 3 + 1)
  600 for i = 1 to q
  610 : h = int(rnd(0) * 6 + 1)
  620 : a(h) = int(rnd(0) * x)
  630 next i
  640 return
  650 :
  660 rem *** uitvoer ***
  670 rem cls :rem scherm wissen
  671 print"{clr}"
  680 print "*** wat is het volgende getal ***"
  690 print
  700 print "niveau         :";n
  710 print "aantal beurten :";t+1
  720 print "perc. goeden   :";y
  730 print
  740 for i = 1 to 6
  750 : print a(i);
  760 next i
  770 print " .?."
  780 return
  790 :
  800 rem *** invoer / verwerking ***
  810 print "wat is het volgende getal <stop = 9999> ";
  820 input e
  830 if e = 9999 then 1050
  840 h = 0 :rem stuurvariabele
  850 a$ = "=> fout <="
  860 p = p - 1 :rem niveau-indicator
  870 t = t + 1 :rem beurt + 1
  880 if e <> a(7) then 930
  890 p = p + 2
  900 h = 1
  910 a$ = "=> goed <="
  920 g = g + h
  930 print a$
  940 print "het getal was ";a(7)
  950 rem ** wachtlus **
  960 for i = 1 to 250 * (2 - h)
  970 next i
  980 rem ** resultaat verwerking **
  990 n = int(p/5)+1
 1000 if n < 7 then 1020
 1010 n = 6
 1020 if n > 0 then 1040
 1030 n = 1
 1040 y = int((g/t) * 1000) / 10 :rem perc. goed
 1050 return
 1060 :
 1070 rem *** vraag ophalen ***
 1080 x = n * 10
 1090 z = n * 5
 1100 b = int(rnd(0) * x + 1)
 1110 r = int(rnd(0) * z + 1)
 1120 h = int(rnd(0) * n + 1)
 1130 on h gosub 150 ,210 ,310 ,310 ,490 ,570
 1140 return
 1150 :
 1160 rem *** resultaat ***
 1170 rem cls
 1171 print"{clr}"
 1180 print "*** wat is het volgende getal ***"
 1190 print
 1200 print "aantal beurten          :";t
 1210 print "aantal goede antwoorden :";g
 1220 print "percentage goed         :";y
 1230 print "niveau                  :";n
 1240 return
 1250 :
 1260 rem *** initialiseren ***
 1270 gosub 70
 1280 rem *** vraag ophalen ***
 1290 gosub 1080
 1300 rem *** uitvoer ***
 1310 gosub 670
 1320 rem *** invoer / verwerking ***
 1330 gosub 810
 1340 if e <> 9999 then 1290
 1350 rem *** resultaat ***
 1360 gosub 1170
 1370 end
