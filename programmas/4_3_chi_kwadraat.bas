   10 rem *** chi-kwadraat ***
   20 dim a(25,2)
   30 data 3.841,5.991,7.815,9.488,11.07
   40 data 12.59,14.07,15.51,16.92,18.31
   50 data 19.68,21.03,22.36,23.68,25.00
   60 data 26.30,27.59,28.87,30.14,31.41
   70 data 32.67,33.92,35.17,36.42,37.65
   80 data 38.88,40.11,41.34,42.56,43.77
   90 goto 790
  100 :
  110 rem *** initialiseren ***
  120 t=0
  130 x=0 :rem chi-kwadraat
  140 rem ** mat a schoonvegen **
  150 for i=1 to 25
  160 : a(i,1)=0
  170 : a(i,2)=0
  180 next i
  190 return
  200 :
  210 rem *** invoer ***
  220 for i=1 to 25
  230 : if (i-1)/5-int((i-1)/5)<>0 then 280
  240 : rem ** kop afdrukken **
  250 : gosub 730
  260 : print "indien geen invoer, toets stop + <return>"
  270 : print
  280 : print "geef theoretische waarneming ";
  290 : input a$
  300 : h=0
  310 : if left$(a$,1)="s" then 380
  320 : h=1
  330 : print "geef de feitelijke waarneming ";
  340 : input b$
  350 : a(i,1)=val(a$)
  360 : a(i,2)=val(b$)
  370 : if h=1 then 400
  380 : t=i-1
  390 : i=25 :rem lus-teller op maximum
  400 next i
  410 if h=0 then 430
  420 t=25
  430 return
  440 :
  450 rem *** rerekening ***
  460 for i=1 to t
  470 : x=x+(a(i,1)-a(i,2))^2/a(i,2)
  480 next i
  490 v=t-1 :rem aantal vrijheidsgraden
  500 restore :rem datapointer vooraan
  510 for i=1 to v
  520 : read k
  530 next i
  540 h=0
  550 if x<k then 570
  560 h=1
  570 return
  580 :
  590 rem *** uitvoer ***
  600 rem ** kop afdrukken **
  610 gosub 730
  620 print
  630 print "chi-kwadraat  :";x
  640 print "aantal vrijheidsgraden ";v
  650 print "kritieke waarde bij 5 % is ";k
  660 a$="h0 wordt geaccepteerd."
  670 if h=0 then 690
  680 a$="h0 wordt verworpen."
  690 print a$
  700 return
  710 :
  720 rem *** kop afdrukken ***
  730 rem cls :rem scherm wissen
  731 print"{clr}"
  740 print "*** chi-kwadraat ***"
  750 return
  760 :
  770 rem **** stuurmodule ****
  780 rem *** initialiseren ***
  790 gosub 120
  800 rem *** invoer ***
  810 gosub 220
  820 rem *** berekening ***
  830 gosub 460
  840 rem *** uitvoer ***
  850 gosub 610
  860 end
