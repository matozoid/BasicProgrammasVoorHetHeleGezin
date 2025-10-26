   10 rem *** welk cijfer is anders ***
   20 rem random :rem dit statement mag vervallen
   30 goto 630
   40 :
   50 rem *** initialiseren ***
   60 g = 0   :rem goede antwoorden teller
   70 t = 10  :rem totaal aantal vragen
   80 a$ = "1234567890"
   90 return
  100 :
  110 rem *** nieuwe vraag ***
  120 a = int(rnd(0) * 10 + 1)
  130 b = int(rnd(0) * 10 + 1)
  140 if a = b then 120
  150 b$ = left$(a$,a)
  160 b$ = right$(b$,1)
  170 c$ = left$(a$,b)
  180 c$ = right$(c$,1)
  190 p = int(rnd(0) * 9 + 1)
  200 return
  210 :
  220 rem *** uitvoer ***
  230 rem cls :rem scherm wissen
  231 print"{clr}"
  240 print "** welk cijfer is anders **"
  250 print "aantal opgaven.........:";x
  260 print "aantal goede antwoorden:";g
  270 print
  280 for i = 0 to 2
  290 : print tab(10);
  300 : for j = 1 to 3
  310 :   d$ = b$
  320 :   if i * 3 + j <> p then 340
  330 :   d$ = c$
  340 :   print d$;
  350 : next j
  360 : print
  370 next i
  380 return
  390 :
  400 rem *** invoer ***
  410 print
  420 print "welk cijfer is anders ";
  430 input d$
  440 e$ = "nee "
  450 if d$ <> c$ then 500
  460 h = 0
  470 e$ = "ja "
  480 h = 1
  490 g = g + 1
  500 print e$; "hoor !  het was ";c$
  510 rem ** wachtlus **
  520 for y = 1 to 250 * (2 - h)
  530 next y
  540 return
  550 :
  560 rem *** resultaat ***
  570 a = int((g / t) * 1000 + 0.5) / 10
  580 print a; "procent goede antwoorden."
  590 return
  600 :
  610 rem **** stuurmodule ****
  620 rem *** initialiseren ***
  630 gosub 60
  640 for x = 1 to t
  650 : rem *** nieuwe vraag ***
  660 : gosub 120
  670 : rem *** uitvoer ***
  680 : gosub 230
  690 : rem *** invoer ***
  700 : gosub 410
  710 next x
  720 rem *** resultaat ***
  730 x = 10
  740 gosub 230
  750 gosub 570
  760 end
