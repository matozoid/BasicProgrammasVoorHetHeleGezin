   10 rem *** benoemen ***
   20 rem random :rem dit statement mag vervallen
   30 dim a$(15),b$(9),d(3)
   40 data 5,ik4,geef1,de5,poes2,melk2
   50 data 5,een5,grote3,fiets2,is1,niets6
   60 data 5,die7,jongen2,draagt1,zijn8,tas2
   70 data 6,het5,paard2,staat1,in9,de5,stal2
   80 data 5,een5,groene3,plant2,bloeit1,nooit6
   90 data 6,deze7,hond2,heeft1,een5,mooie3,staart2
  100 data 6,zijn8,boek2,staat1,in9,de5,kast2
  110 data 5,een5,plaats2,in9,de5,schouwburg2
  120 data 4,nergens6,staat1,de5,weg2
  130 data 6,zijn8,moeder2,kent1,het5,verhaal2,ook6
  140 data 9,de5,lezer2,van9,de5,krant2,moet1,de5
  150 data puzzel2,raden1
  160 goto 1140
  170 :
  180 rem *** initialiseren ***
  190 b$(1) = "werkwoord"
  200 b$(2) = "zelfstandig naamwoord"
  210 b$(3) = "bijvoeglijk naamwoord"
  220 b$(4) = "persoonlijk voornaamwoord"
  230 b$(5) = "lidwoord"
  240 b$(6) = "bijwoord"
  250 b$(7) = "aanwijzend voornaamwoord"
  260 b$(8) = "bezittelijk voornaamwoord"
  270 b$(9) = "voorzetsel"
  280 c$ = "-------------------------"
  290 t = 0 :rem totaal aantal vragen
  300 g = 0 :rem aantal goed
  310 n = 0 :rem perc. goed
  320 z = 11:rem aantal zinnen
  330 p = 1 :rem stuurvariabele
  340 return
  350 :
  360 rem *** vraag ophalen ***
  370 x = int(rnd(0) * z + 1)
  380 restore :rem datapointer vooraan
  390 for i = 1 to x
  400 : read a :rem aantal strings
  410 : for j = 1 to a
  420 :   read a$(j)
  430 : next j
  440 next i
  450 l = int(rnd(0) * a + 1)
  460 c = val(right$(a$(l),1))
  470 return
  480 :
  490 rem ** multiple choice opbouwen **
  500 for i = 1 to 3
  510 : d(i) = int(rnd(0) * 6 + 1)
  520 : if d(i) = c then 510
  530 : if i = 1 then 600
  540 : h = 0
  550 : for j = 1 to i - 1
  560 :   if d(i) <> d(j) then 580
  570 :   h = 1
  580 : next j
  590 : if h = 1 then 510
  600 next i
  610 rem ** goede antwoord plaatsen **
  620 p = int(rnd(0) * 3 + 1)
  630 d(p) = c
  640 return
  650 :
  660 rem *** uitvoer ***
  670 rem cls :rem scherm wissen
  671 print"{clr}"
  680 print "*** benoemen ***"
  690 print
  700 print "beurt            :";t+1
  710 print "goede antwoorden :";g
  720 print "percentage goed  :";n
  730 print
  740 r = 0
  750 if p = 0 then 890
  760 for i = 1 to a
  770 : y = len(a$(i)) - 1
  780 : if i >= l then 800
  790 : r = r + y + 1
  800 : print left$(a$(i),y);" ";
  810 next i
  820 print "."
  830 y = len(a$(l)) - 1
  840 print tab(r)left$(c$,y)
  850 print "wat is : ";left$(a$(l),y)
  860 for i = 1 to 3
  870 : print tab(8) i;" : ";b$(d(i))
  880 next i
  890 return
  900 :
  910 rem *** invoer/ verwerking ***
  920 print "wat is het goede antwoord <stop = 0>";
  930 input q
  940 if q = 0 then 1100
  950 if q < 0 or q > 3 then 920
  960 h = 0
  970 d$ = "=> fout <="
  980 if q <> p then 1010
  990 h = 1
 1000 d$ = "=> goed <="
 1010 print "het antwoord was nr.";p;b$(c)
 1020 print d$
 1030 rem ** wachtlus **
 1040 for i = 1 to 250 * (2 - h)
 1050 next i
 1060 rem ** resultaat verwerking **
 1070 g = g + h
 1080 t = t + 1
 1090 n = int((g/t) * 100 + 0.5)
 1100 return
 1110 :
 1120 rem **** stuurmodule ****
 1130 rem *** initialiseren ***
 1140 gosub 190
 1150 rem *** vraag ophalen ***
 1160 gosub 370
 1170 rem *** multiple choice opbouwen ***
 1180 gosub 500
 1190 rem *** uitvoer ***
 1200 gosub 670
 1210 rem *** invoer/ verwerking ***
 1220 gosub 920
 1230 if q <> 0 then 1160
 1240 p = 0
 1250 t = t - 1
 1260 gosub 670
 1270 end
