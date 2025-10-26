   10 rem *** ontleden ***
   20 rem random:rem dit statement mag vervallen
   30 dim a$(15), b$(6), d(3)
   40 data 3,"de hond1",loopt2,"op straat5"
   50 data 4,ik1,geef2,jou3,"een brief4"
   60 data 3,"de poes1",likt2,"zijn vacht4"
   70 data 3,het1,regent2,"de hele dag5"
   80 data 3,"de bloemen1",liggen2,"op straat5"
   90 data 3,"de doos1",zit2,"vol rommel4"
  100 data 4,ik1,geef2,"de hond3","een kluif4"
  110 data 3,je1,hebt2,"een leuke jurk4"
  120 data 3,"de tas1",staat2,"op tafel5"
  130 data 3,"die tafel1",staat2,"op zolder5"
  140 goto 1090
  150 :
  160 rem **** initialiseren ***
  170 b$(1) = "onderwerp"
  180 b$(2) = "gezegde"
  190 b$(3) = "meewerkend voorwerp"
  200 b$(4) = "lijdend voorwerp"
  210 b$(5) = "bijwoordelijke bepaling"
  220 b$(6) = "bijvoeglijke bepaling"
  230 c$ = "-------------------------"
  240 t = 0  :rem totaal aantal vragen
  250 g = 0  :rem aantal goed
  260 n = 0  :rem perc. goed
  270 z = 10 :rem aantal z innen
  280 p = 1  :rem stuurvariabele
  290 return
  300 :
  310 rem *** vraag ophalen ***
  320 x = int(rnd(0) * z + 1)
  330 restore    :rem datapointer vooraan
  340 for i = 1 to x
  350 : read a :rem aantal strings
  360 : for j = 1 to a
  370 :   read a$(j)
  380 : next j
  390 next i
  400 l = int(rnd(0) * a + 1)
  410 c = val(right$(a$(l),1))
  420 return
  430 :
  440 rem ** multiple choice opbouwen **
  450 for i = 1 to 3
  460 : d(i) = int(rnd(0) * 6 + 1)
  470 : if d(i) = c then 460
  480 : if i = 1 then 550
  490 : h = 0
  500 : for j = 1 to i - 1
  510 :   if d(i) <> d(j) then 530
  520 :   h = 1
  530 : next j
  540 : if h = 1 then 460
  550 next i
  560 rem ** goede antwoord plaatsen **
  570 p = int(rnd(0) * 3 + 1)
  580 d(p) = c
  590 return
  600 :
  610 rem *** uitvoer ***
  620 rem cls          :rem scherm wissen
  621 print"{clr}"
  630 print "*** ontleden ***"
  640 print
  650 print "beurt            :";t+1
  660 print "goede antwoorden :";g
  670 print "percentage goed  :";n
  680 print
  690 r = 0
  700 if p = 0 then 840
  710 for i = 1 to a
  720 : y = len(a$(i)) - 1
  730 : if i >= l then 750
  740 : r = r + y + 1
  750 : print left$(a$(i),y);" ";
  760 next i
  770 print
  780 y = len(a$(l)) - 1
  790 print tab(r)left$(c$,y)
  800 print "wat is : ";left$(a$(l),y)
  810 for i = 1 to 3
  820 : print tab(10) i;" : ";b$(d(i))
  830 next i
  840 return
  850 :
  860 rem *** invoer/ verwerking ***
  870 print "wat is het goede antwoord <stop = 0>";
  880 input q
  890 if q = 0 then 1050
  900 if q < 0 or q > 3 then 870
  910 h = 0
  920 d$ = "=> fout <="
  930 if q <> p then 960
  940 h = 1
  950 d$ = "=> goed <="
  960 print "het antwoord was nr.";p;b$(c)
  970 print d%
  980 rem ** wachtlus **
  990 for i = 1 to 250 * (2 - h)
 1000 next i
 1010 rem ** resultaat verwerking **
 1020 g = g + h
 1030 t = t + 1
 1040 n = int((g/t) * 100 + 0.5)
 1050 return
 1060 :
 1070 rem **** stuurmodule ****
 1080 rem *** initialiseren ***
 1090 gosub 170
 1100 rem *** vraag ophalen ***
 1110 gosub 320
 1120 rem *** multiple choice opbouwen ***
 1130 gosub 450
 1140 rem *** uitvoer ***
 1150 gosub 620
 1160 rem *** invoer/ verwerking ***
 1170 gosub 870
 1180 if q <> 0 then 1110
 1190 p = 0
 1200 t= t - 1
 1210 gosub 620
 1220 end
