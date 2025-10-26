   10 rem *** zet de getallen op volgorde ***
   20 dim a(9), b(9)
   30 rem random :rem dit statement kan worden weggelaten
   40 goto 990
   50 :
   60 rem *** initialiseren ***
   70 for i = 1 to 9
   80 : a(i) = int(rnd(0) * 20 + 1)
   90 : if i = 1 then 170
  100 : h = 0   :rem stuurvariabele
  110 : for j = 1 to i - 1
  120 :   if a(i) <> a(j) then 150
  130 :   h = 1
  140 :   j = j + 1
  150 : next j
  160 : if h = 1 then 80
  170 : b(i) = a(i)
  180 next i
  190 rem ** mat b sorteren **
  200 for i = 9 to 2 step -1
  210 : for j = 1 to i
  220 :   if b(i) > b(j) then 260
  230 :   h = b(i)
  240 :   b(i) = b(j)
  250 :   b(j) = h
  260 : next j
  270 next i
  280 b = 1   :rem beurt-teller
  290 return
  300 :
  310 rem *** uitvoer ***
  320 rem cls rem scherm wissen
  321 print"{clr}"
  330 print "*** zet de getallen op volgorde ***"
  340 print "beurt :";b
  350 print
  360 print "vak "
  370 for i = 1 to 9
  380 : x = 5 + i * 4 - 5 :rem tab-positie
  390 : print tab(x) i;
  400 next i
  410 print:print
  420 print tab(3) "!---!---!---!---!---!---!---!---!---!"
  430 print "getal"
  440 for i = 1 to 9
  450 : x = 5 + i * 4 - 5 :rem tab-positie
  460 : print tab(x); a(i);
  470 next i
  480 print
  490 print tab(3) "!---!---!---!---!---!---!---!---!---!"
  500 return
  510 :
  520 rem *** invoer ***
  530 print "klaar = 0 "
  540 print "wissel vak :";
  550 input x
  560 if x = 0 then 700
  570 x = int(x)
  580 if x < 1 or x > 9 then 540
  590 print "met vak     :";
  600 input y
  610 if y = 0 then 700
  620 y = int (y)
  630 if y < 1 or y > 9 then 590
  640 rem ** verwerking **
  650 b = b + 1 :rem beurten-teller
  660 rem * wisselen *
  670 h = a(x)
  680 a(x) = a(y)
  690 a(y) = h
  700 return
  710 :
  720 rem *** controle ***
  730 h = 1
  740 a$ = "goed"
  750 for i = 2 to 9
  760 : if a(i-1) < a(i) then 800
  770 : a$ = "fout"
  780 : h = 0
  790 : i = 9
  800 next i
  810 return
  820 :
  830 rem *** resultaat ***
  840 gosub 320
  850 if h = 1 then 920
  860 for i = 1 to 9
  870 : x = 5 + i * 4 - 3
  880 : print tab(x) b(i);
  890 next i
  900 print
  910 print tab(10) "moet het zijn  !"
  920 print "het antwoord is ";a$;" !"
  930 if h <> 1 then 950
  940 print "in ";b;"beurten."
  950 return
  960 :
  970 rem **** stuurmodule ****
  980 rem *** initialiseren ***
  990 gosub 70
 1000 rem *** uitvoer ***
 1010 gosub 320
 1020 rem *** invoer ***
 1030 gosub 530
 1040 if x <> 0 and y <> 0 then 1010
 1050 rem *** controle ***
 1060 gosub 730
 1070 rem *** resultaat ***
 1080 gosub 840
 1090 end
