   10 rem *** zet in alfabetische volgorde ***
   20 dim a$(7), b$(7)
   30 rem random :rem dit statement kan worden weggelaten
   40 goto 1140
   50 :
   60 rem *** initialiseren ***
   70 a$ = "abcdefghijklmnopqrstuvwxyz"
   80 x = (n + 1)/2
   90 for i = 1 to 7
  100 : a$(i) = ""
  110 : if (n + 1)/2 - int((n + 1)/2) = 0 then 140
  120 : y = (n + 2)/2
  130 : x = int(rnd(0) * y + 1)
  140 : for j = 1 to x
  150 :   a = int(rnd(0) * 26 + 1)
  160 :   b$ = left$(a$,a)
  170 :   a$(i) = a$(i) + right$(b$,1)
  180 : next j
  190 : if i = 1 then 270
  200 : h = 0         :rem stuurvariabele
  210 : for j = 1 to i - 1
  220 :   if a$(i) <> a$(j) then 250
  230 :   h = 1
  240 :   j = i
  250 : next j
  260 : if h = 1 then 100
  270 : b$(i) = a$(i)
  280 next i
  290 rem ** mat b$ sorteren **
  300 for i = 7 to 2 step -1
  310 : for j = 1 to i
  320 :   if b$(i) > b$(j) then 360
  330 :   a$ = b$(i)
  340 :   b$(i) = b$(j)
  350 :   b$(j) = a$
  360 : next j
  370 next i
  380 b = 1           :rem beurt-teller
  390 return
  400 :
  410 rem *** uitvoer ***
  420 rem cls          :rem scherm wissen
  421 print "{clr}"
  430 print "*** zet in alfabetische volgorde ***"
  440 print "niveau :";n
  450 print "beurt  :";b
  460 print
  470 print "vak ";
  480 for i = 1 to 7
  490 : x = 8 + i * 4 - 3 :rem tab-positie
  500 : print tab(x) i;
  510 next i
  520 print
  530 print tab(8) "!---!---!---!---!---!---!---!"
  540 print "letters";
  550 for i = 1 to 7
  560 : x = 8 + i * 4 - 3  :rem tab-positie
  570 : print tab(x) a$(i);
  580 next i
  590 print
  600 print tab(8) "!---!---!---!---!---!---!---!"
  610 return
  620 :
  630 rem *** invoer ***
  640 print "klaar = 0 "
  650 print "wissel vak  :";
  660 input x
  670 if x = 0 then 810
  680 x = int(x)
  690 if x < 1 or x > 7 then 650
  700 print "met vak     :";
  710 input y
  720 if y = 0 then 810
  730 y = int(y)
  740 if y < 1 or y > 7 then 700
  750 rem ** verwerking **
  760 b = b + 1       :rem beurten-teller
  770 rem * wisselen *
  780 a$ = a$(x)
  790 a$(x) = a$(y)
  800 a$(y) = a$
  810 return
  820 :
  830 rem *** controle ***
  840 h = 1
  850 a$ = "goed"
  860 for i = 2 to 7
  870 : if a$(i-1) < a$(i) then 910
  880 : a$ = "fout"
  890 : h = 0
  900 : i = 7
  910 next i
  920 return
  930 :
  940 rem *** resultaat ***
  950 gosub 420
  960 if h = 1 then 1050
  970 n = n - 1
  980 if n => 1 then 990
  990 for i = 1 to 7
 1000 : x = 8 + i * 4 - 3
 1010 : print tab(x) b$(i);
 1020 next i
 1030 print
 1040 print tab(10) "moet het zijn  !"
 1050 print "het antwoord is ";a$;" !"
 1060 if h <> 1 then 1110
 1070 print "in ";b;"beurten."
 1080 n = n + 1
 1090 if n < 6 then 1110
 1100 n = 5
 1110 return
 1120 :
 1130 rem **** stuurmodule ****
 1140 n = 1             :rem startniveau
 1150 rem **** initialiseren ***
 1160 gosub 70
 1170 rem *** uitvoer ***
 1180 gosub 420
 1190 rem *** invoer ***
 1200 gosub 640
 1210 if x <> 0 and y <> 0 then 1180
 1220 rem *** controle ***
 1230 gosub 840
 1240 rem *** resultaat ***
 1250 gosub 950
 1260 print "wil je doorgaan <ja/nee> ";
 1270 input a$
 1280 if left$(a$,1) = "j" then 1160
 1290 end
