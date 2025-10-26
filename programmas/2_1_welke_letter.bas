   10 rem *** welke letter is anders ***
   20 rem random :rem dit statement mag vervallen
   30 goto 650
   40 :
   50 rem *** initialiseren ***
   60 g = 0   :rem goede antwoorden teller
   70 f = 10  :rem totaal aantal vragen
   80 t =0
   90 a$ = "abcdefghijklmnopqrstuvwxyz"
  100 return
  110 :
  120 rem *** nieuwe vraag ***
  130 a = int(rnd(0) * 26 + 1)
  140 b = int(rnd(0) * 26 + 1)
  150 if a = b then 130
  160 b$ = left$(a$,a)
  170 b$ = right$(b$,1)
  180 c$ = left$(a$,b)
  190 c$ = right$(c$,1)
  200 p = int(rnd(0) * 9 + 1)
  210 t = t + 1
  220 return
  230 :
  240 rem *** uitvoer ***
  250 rem cls :rem scherm wissen
  251 print "{clr}"
  260 print "*** welke letter is anders ***"
  270 print "aantal opgaven..........:";t
  280 print "aantal goede antwoorden.:";g
  290 print
  300 for i = 1 to 2
  310 : print tab (10);
  320 : for j = 1 to 3
  330 :   d$ = b$
  340 :   if i * 3 + j <> p then 360
  350 :   d$ = c$
  360 :   print d$;
  370 : next j
  380 : print
  390 next i
  400 return
  410 :
  420 rem *** invoer i ***
  430 print
  440 print "welke letter is anders ";
  450 input d$
  460 e$ = "nee "
  470 h = 0
  480 if d$ <> c$ then 520
  490 h = 1
  500 e$ = "ja "
  510 g = g + 1
  520 print e$; "hoor !  het was ";c$
  530 rem ** wachtlus **
  540 for y = 1 to 250 * (2 - h)
  550 next y
  560 return
  570 :
  580 rem *** resultaat ***
  590 a = int((g / t) * 1000 + .5) / 10
  600 print a; "procent goede antwoorden."
  610 return
  620 :
  630 rem **** stuurmodule ****
  640 rem *** initialiseren ***
  650 gosub 60
  660 for x = 1 to f
  670 : rem *** nieuwe vraag ***
  680 : gosub 130
  690 : rem *** uitvoer ***
  700 : gosub 250
  710 : rem *** invoer i ***
  720 : gosub 430
  730 next x
  740 rem *** resultaat ***
  750 gosub 250
  760 gosub 590
  770 end
