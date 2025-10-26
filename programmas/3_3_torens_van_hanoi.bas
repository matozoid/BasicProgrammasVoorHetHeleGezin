   10 rem *** torens van hanoi ***
   20 dim a(8,3)
   30 goto 1060
   40 :
   50 rem *** initialiseren ***
   60 s = 15
   70 for i = 1 to 8
   80 : a(i,1) = s-2*i
   90 : a(i,2) = 0
  100 : a(i,3) = 0
  110 next i
  120 b = 1
  130 q = 7
  140 a$ = "*************"
  150 return
  160 :
  170 rem *** invoer i ***
  180 gosub 360 :rem *** uitvoer ***
  190 print "hoeveel schijven <min.=3 max.=7> ";
  200 input q
  210 if q < 3 or q > 7 then 180
  220 if q = 7 then 320
  230 rem ** gedeeltelijk opnieuw initialiseren ***
  240 s = a(7 - q,1)
  250 for i = q to 7
  260 : a(i,1) = 0 :rem staaf schoonmaken
  270 next i
  280 rem * schijven plaatsen *
  290 for i = 1 to q
  300 : a(i,1) = s-2*i
  310 next i
  320 a(8,1) = q
  330 return
  340 :
  350 rem *** uitvoer ***
  360 rem cls
  361 print "{clr}"
  370 print "*** torens van hanoi ***"
  380 print "beurt ";b
  390 print
  400 print tab(5)1; tab(19)2; tab(33)3
  410 print
  420 for i = 7 to 1 step -1
  430 : for j = 1 to 3
  440 :   b$ = "i"
  450 :   v = 6
  460 :   if a(i,j) = 0 then 490
  470 :   v = (13 - a(i,j))/2
  480 :   b$ = right$(a$,a(i,j))
  490 :   p = j * 14 - 14 + v
  500 :   print tab(p)b$;
  510 : next j
  520 : print
  530 next i
  540 return
  550 :
  560 rem *** invoer ii ***
  570 print "van staafnummer <stop = 0> ";
  580 input d
  590 if d = 0 then 640
  600 if d < 0 or d > 3 then 570
  610 print "naar staafnummer ";
  620 input f
  630 if f < 0 or f > 3 then 610
  640 return
  650 :
  660 rem *** bewerking ***
  670 h = 1
  680 b = b + 1
  690 if a(8,d) = 0 or a(8,f) = q then 800
  700 h = 0
  710 rem ** schijf van staaf-d halen **
  720 c = a(8,d)
  730 a(8,d) = a(8,d) - 1
  740 p = a(c,d)
  750 a(c,d) = 0
  760 rem ** schijf op staaf-f zetten **
  770 a(8,f) = a(8,f) + 1
  780 c = a(8,f)
  790 a(c,f) = p
  800 return
  810 :
  820 rem *** controle ***
  830 if a(8,f) = 1 and d <> 0 then 940
  840 if d <> 0 then 860
  850 f = 3
  860 for i = 1 to a(8,f) - 1
  870 : if a(i,f) > a(i+1,f) then 900
  880 : h = 1
  890 : i = a(8,f)
  900 next i
  910 if h = 1 or d <> 0 then 940
  920 if a(8,f) = q then 940
  930 h = 1
  940 return
  950 :
  960 rem *** resultaat ***
  970 gosub 360 :rem *** uitvoer ***
  980 b$ = "fout ! <="
  990 if h = 1 then 1010
 1000 b$ = "goed ! <="
 1010 print "het is ";b$
 1020 return
 1030 :
 1040 rem **** stuurmodule ****
 1050 rem *** inititialiseren ***
 1060 gosub 60
 1070 rem *** invoer i **
 1080 gosub 180
 1090 rem *** uitvoer ***
 1100 gosub 360
 1110 rem *** invoer ***
 1120 gosub 570
 1130 if d = 0 then 1180
 1140 rem *** bewerking ***
 1150 gosub 670
 1160 if h = 1 then 1210
 1170 rem *** controle ***
 1180 gosub 830
 1190 if d <> 0 and h <> 1 then 1100
 1200 rem *** resultaat ***
 1210 gosub 970
 1220 end
