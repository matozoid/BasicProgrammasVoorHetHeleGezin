   10 rem *** doolhof ***
   20 dim a(31,30), b(16)
   30 rem random :rem dit statement mag vervallen
   40 goto 1040
   50 :
   60 rem *** initialiseren ***
   70 b$(1) = "   !"
   80 b$(2) = "---!"
   90 b$(3) = "   "
  100 return
  110 :
  120 rem *** invoer ***
  130 rem cls :rem scherm wissen
  131 print"{clr}"
  140 print "*** doolhof ***"
  150 print
  160 print "hoogte van het doolhof ";
  170 input h
  180 if h < 1 or h > 31 then 160
  190 if h/2  - int(h/2) <> 0 then 210
  200 h = h - 1
  210 print "breedte van het doolhof ";
  220 input b
  230 if b < 0 or b > 30 then 210
  240 return
  250 :
  260 rem *** doolhof opbouwen ***
  270 rem ** basis doolhof opbouwen **
  280 k = int(b/3)
  290 if k < 6 then 310
  300 k = 5
  310 for x = 1 to h step 2
  320 : for y = 0 to 1
  330 :   i = x + y
  340 :   if i > h then 380
  350 :   for j = 1 to b
  360 :     a(i,j) = abs(y-1)
  370 :   next j
  380 : next y
  390 next x
  400 rem ** doorgangen maken **
  410 for i = 1 to h step 2
  420 : x = int(rnd(0) * b + 1)
  430 : p = (i + 1)/2
  440 : if i = 1 then 460
  450 : if abs(b(p-1) - x) > k then 420
  460 : b(p) = x
  470 : a(i,x) = 0
  480 next i
  490 rem ** willekeurige doorgangen **
  500 rem ** extra ingang ! **
  510 x = int(rnd(0) * b + 1)
  520 a(1,x) = 0
  530 for i = 3 to h - 2 step 2
  540 : y = int(rnd(0) * k + 1)
  550 : for p = 1 to y
  560 :   j = int(rnd(0) * b + 1)
  570 :   if a(i,j) = 0 then 560
  580 :   a(i,j) = 0 :rem doorgang
  590 : next p
  600 next i
  610 for i = 2 to h-1 step 2
  620 : y = int(rnd(0) * b + 1)
  630 : for p = 1 to y
  640 :   j = int(rnd(0) * b + 1)
  650 :   if a(i,j) = 2 then 640
  660 :   a(i,j) = 2
  670 : next p
  680 next i
  690 rem ** obstakels weghalen **
  700 for i = 2 to h-1 step 2
  710 : p=(i + 2) / 2
  720 : a = b(p - 1)
  730 : c = b(p)
  740 : s = 1 :rem stapgrootte
  750 : if a <= c then 770
  760 : s = -1
  770 : for j = a to c step s
  780 :   a(i,j) = 2
  790 : next j
  800 next i
  810 return
  820 :
  830 rem *** uitvoer van doolhof ***
  840 rem cls :rem scherm wissen
  841 print"{clr}"
  850 print "*** doolhof ***"
  860 print
  870 for i = 1 to h
  880 : print "!";
  890 : for j = 1 to b
  900 :   p = a(i,j) + 1
  910 :   print b$(p);
  920 :   if a(i,j) <> 2 then 970
  930 :   b$ = " "
  940 :   if j < b then 960
  950 :   b$ = "!"
  960 :   print b$;
  970 : next j
  980 : print
  990 next i
 1000 return
 1010 :
 1020 rem *** stuurmodule ***
 1030 rem *** initialiseren ***
 1040 gosub 70
 1050 rem *** invoer ***
 1060 gosub 130
 1070 rem *** doolhof opbouwen ***
 1080 gosub 280
 1090 rem *** uitvoer ***
 1100 gosub 840
 1110 print "wilt u nog een doolhof <ja/nee>";
 1120 input b$
 1130 if left$ (b$, 1) = "j" then 1040
 1140 end
