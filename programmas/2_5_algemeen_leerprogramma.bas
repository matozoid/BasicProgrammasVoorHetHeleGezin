   10 rem *** algemeen leerprogramma ***
   20 data aardrijkskunde
   30 data "wat is de hoofdstad van"
   40 data "welk land hoort bij"
   50 data amsterdam,nederland,brussel,belgie
   60 data londen,engeland,bonn,duitsland,warschau,polen
   70 data wenen,oostenrijk,bern,zwitserland
   80 data parijs,frankrijk,rome,italie
   90 data <stop>,<stop>
  100 dim a$(20,2),b$(2),c(10)
  110 rem random :rem dit statement mag vervallen
  120 goto 1150
  140 rem *** lezen interne datafile ***
  150 restore
  160 read t$, b$(1), b$(2)
  170 x = 0 :rem hulpteller
  180 x = x + 1
  190 read a$(x,1), a$(x,2)
  200 if a$(x,1) = "<stop>"then 230
  210 n = x :rem opgaventeller
  220 if n < 20 then 180
  230 return
  250 rem *** initialiseren ***
  260 rem ** foutmatrix schoonvegen **
  270 for i = 1 to 10
  280 : c(i) = 0
  290 next i
  300 rem ** variabelen op startwaarde **
  310 t = 0 :rem totaal vragen
  320 g = 0 :rem aantal goeden
  330 f = 0 :rem fouten in fouttabel
  340 y = 0 :rem goedperc.
  350 return
  370 rem *** vraag ophalen ***
  380 j = int(rnd(0) * 2 + 1)
  390 h = int(rnd(0) * n + 1)
  400 if rnd(0) > 0.6 or f = 0 then 430
  410 h = int(rnd(0) * f + 1)
  420 h = c(h)
  430 if t = 0 then 450
  440 y = int((g/t)*1000 + 0.5)/10
  450 q$ = a$(h,1)
  460 z$ = a$(h,2)
  470 if j = 1 then 500
  480 q$ = a$(h,2)
  490 z$ = a$(h,1)
  500 return
  520 rem *** uitvoer ***
  530 rem cls :rem scherm wissen
  531 print"{clr}"
  540 print "*** algemeen leerprogramma ***"
  550 print "onderwerp  :";t$
  560 print "beurt      :";t + 1
  570 print "perc. goed :";y
  580 print
  590 print "stoppen is : 'stop'+<return>"
  600 print b$(j);" ";z$;" ";
  610 return
  630 rem *** invoer/verwerking ***
  640 input e$
  650 z = 3
  660 if e$ = "stop" then 790
  670 t = t + 1 :rem beurt + 1
  680 z = 0
  690 if e$ <> q$ then 710
  700 z = 1
  710 g = g + z
  720 on z + 1 gosub 970 ,820
  730 print tab(10) r$
  740 print "het antwoord was :";q$
  750 rem ** wachtlus **
  760 for i = 1 to 250 * (2 - z)
  770 next i
  780 y = ((g/t) * 1000 + 0.5)/10
  790 return
  810 rem *** antwoord was goed ***
  820 r$ = "=> goed <="
  830 if f = 0 then 1010
  840 for i = 1 to f
  850 : if h <> c(i) then 930
  860 : for j = i to f - 1
  870 :   c(j) = c(j + 1)
  880 : next j
  890 : i = f :rem lus op eindwaarde
  900 : f = f - 1
  910 : if f >= 0 then 930
  920 : f = 0
  930 next i
  940 return
  960 rem *** antwoord was fout ***
  970 r$ = "=> fout <="
  980 if f > 9 then 1010
  990 f = f + 1
 1000 c(f) = h
 1010 return
 1030 rem *** resultaat ***
 1040 rem cls
 1041 print"{clr}"
 1050 print "*** algemeen leerprogramma ***"
 1060 print "onderwerp              :";t$
 1070 print
 1080 print "totaal aantal beurten  :";t
 1090 print "totaal goed beantwoord :";g
 1100 print "percentage goed        :";y
 1110 return
 1130 rem **** stuurmodule ****
 1140 rem *** interne file lezen ***
 1150 gosub 150
 1160 rem *** initialiseren ***
 1170 gosub 270
 1180 rem *** vraag ophalen ***
 1190 gosub 380
 1200 rem *** uitvoer ***
 1210 gosub 530
 1220 rem *** invoer/verwerking ***
 1230 gosub 640
 1240 if z < 3 then 1190
 1250 rem *** resultaat ***
 1260 gosub 1040
 1270 end
