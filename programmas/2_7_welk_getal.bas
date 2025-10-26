   10 rem *** welk getal ontbreekt ***
   20 dim a(9)
   30 rem random :rem dit statement mag vervallen
   40 goto 860
   50 :
   60 rem *** initialiseren ***
   70 t = 0  :rem aantal vragen
   80 g = 0  :rem aantal goeden
   90 n = 1  :rem niveau
  100 p = 1 :rem niveauindicatie
  110 k = 0 :rem perc. goeden
  120 a$="!---!---!---!"
  130 return
  140 :
  150 rem *** vraag opbouwen ***
  160 x = int(rnd(0) * (n - 1) * 10)
  170 for i = 1 to 9
  180 : a(i) = i + x
  190 next i
  200 x = int(rnd(0) * 9 + 1)
  210 a = a(x)
  220 a(x) = 0
  230 if t = 0 then 250
  240 k = int((g/t) * 1000 + 0.5)/10
  250 return
  260 :
  270 rem *** uitvoer ***
  280 rem cls rem scherm wissen
  281 print"{clr}"
  290 print "*** welk getal ontbreekt ***"
  300 print "niveau       :";n
  310 print "beurt        :";t+1
  320 print "perc. goeden :";k
  330 print
  340 print tab(5) a$
  350 for i = 0 to 2
  360 : for j = 1 to 3
  370 :   y = i * 3 + j
  380 :   h=j * 4 - 3 + 5
  390 :   if a(y) <> 0 then 420
  400 :   print tab(h)" ?";
  410 :   goto 430
  420 :   print tab(h)a(y);
  430 : next j
  440 : print
  450 : print tab(5)a$
  460 next i
  470 return
  480 :
  490 rem *** invoer / verwerking ***
  500 print "welk getal ontbreekt <stop = 0> ";
  510 input r
  520 if r = 0 then 730
  530 t=t + 1 :rem beurt + 1
  540 p = p - 1
  550 h = 0   :rem hulpvariabele
  560 b$ = "=> fout <="
  570 if r <> a then 620
  580 b$ = "=> goed <="
  590 h = 1
  600 g = g + 1
  610 p =p + 2
  620 if p < 50 then 640
  630 p = 50
  640 if p > 0 then 660
  650 p = 1
  660 n = int(p/5 + 1) :rem niveau
  670 print tab(10) b$
  680 print "het antwoord was "; a
  690 rem ** wachtlus **
  700 for i = 1 to 250 * (2 - h)
  710 next i
  720 k = int((g/t) * 1000 + 0.5)/10
  730 return
  740 :
  750 rem *** resultaat ***
  760 rem cls :rem scherm wissen
  761 print"{clr}"
  770 print "*** welk getal ontbreekt ***"
  780 print
  790 print "bereikt niveau  :";n
  800 print "aantal beurten  :";t
  810 print "perc. goeden    :";k
  820 return
  830 :
  840 rem **** stuurmodule ****
  850 rem *** initialiseren ***
  860 gosub 70
  870 rem *** vraag opbouwen ***
  880 gosub 160
  890 rem *** uitvoer ***
  900 gosub 280
  910 rem *** invoer / verwerking ***
  920 gosub 500
  930 if r <> 0 then 880
  940 rem *** resultaat ***
  950 gosub 760
  960 end
