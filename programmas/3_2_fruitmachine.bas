   10 rem *** fruitmachine ***
   20 dim a$(6), b(3), d(10,2)
   30 rem random
   40 data "-  joker  -","-   bar   -","-  klok   -"
   50 data "- citroen -","-  appel  -","-  kers   -"
   60 data 111,20, 221,15, 333,12, 331,12, 444,8
   70 data 441,8, 555,5, 551,5, 66,3, 6,2
   80 goto 760
   90 :
  100 rem *** initialiseren ***
  110 restore
  120 rem ** symbolen lezen **
  130 for i = 1 to 6
  140 : read a$(i)
  150 next i
  160 rem ** waardering lezen **
  170 for i = 1 to 10
  180 : read d(i,1), d(i,2)
  190 next i
  200 t = 0
  210 b = 0
  220 return
  230 :
  240 rem *** draaien ***
  250 y = int(rnd(0) * 10 + 1)
  260 for i = 1 to y
  270 : s = 0
  280 : for j = 1 to 3
  290 :   b(j) = int(rnd(0) * 6 + 1)
  300 :   s = s * 10 + b(j)
  310 : next j
  320 next i
  330 return
  340 :
  350 rem *** resultaat ***
  360 h = 0 :rem stuurvariabele
  370 b = b * -1
  380 if b = 0 then 510
  390 for i = 1 to 8
  400 : if s <> d(i,1) then 430
  410 : h = i
  420 : i = 8 :rem lusteller max.
  430 next i
  440 if h <> 0 then 490
  450 h = 9
  460 if d(h,1) = b(1) * 10 + b(2) then 490
  470 h = 10
  480 if d(h,1) <> b(1) then 500
  490 b = d(h,2) * abs(b)
  500 t = t + b :rem totaal winst
  510 return
  520 :
  530 rem *** uitvoer ***
  540 rem cls :rem scherm wissen
  541 print "{clr}"
  550 print "*** fruitmachine ***"
  560 print
  570 print "deze beurt :"b
  580 print "totaal     :"t
  590 print "   !---------!!---------!!---------!"
  600 for i = 1 to 3
  610 : print tab(i* 11 - 8)a$(b(i));
  620 next i
  630 print
  640 print "   !---------!!---------!!---------!"
  650 print
  660 return
  670 :
  680 rem *** invoer ***
  690 print "hoeveel zet je in <stop = 0> ";
  700 input b
  710 if b < 0 or b > 5 then 690
  720 return
  730 :
  740 rem **** stuurmodule ****
  750 rem *** initialiseren ***
  760 gosub 110
  770 rem *** draaien ***
  780 gosub 250
  790 rem *** resultaat ***
  800 gosub 360
  810 rem *** uitvoer ***
  820 gosub 540
  830 rem *** invoer ***
  840 gosub 690
  850 if b <> 0 then 780
  860 end
