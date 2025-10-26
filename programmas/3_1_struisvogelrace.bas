   10 rem *** struisvogel race ***
   20 rem random :rem dit statement kan vervallen
   30 dim a(6,2), b$(6)
   40 data wegracer,6,wooper,3,"langzame jenny",10
   50 data "driftige floeper",5,"struise bol",12
   60 data "lopend potlood",4
   70 goto 1110
   90 rem *** initialiseren ***
  100 r = 0    :rem aantal races
  110 b = 1000 :rem totaal aan inzet
  120 rem ** interne data-file lezen **
  130 restore
  140 for i = 1 to 6
  150 : read b$(i),a(i,2)
  160 next i
  170 return
  190 rem *** invoer ***
  200 rem cls :rem scherm wissen
  201 print"{clr}"
  210 print "*** struisvogelrace ***"
  220 print "race-nummer ";r+1 ;tab(20)"maximale inzet ";b
  230 print
  240 for i = 1 to 6
  250 : print i;b$(i);tab(25)a(i,2);tab(29)": 1"
  260 next i
  270 print
  280 print "wat is uw keuze <stop = 0> ";
  290 input k
  300 if k = 0 then 420
  310 if k < 0 or k > 6 then 200
  320 print "hoeveel zet u in op ";b$(k)
  330 print "u kunt maximaal ";b;"inzetten ! hoeveel ";
  340 input l
  350 if l < 0 or l > b then 320
  360 b = b - l
  370 rem ** start race **
  380 for i = 1 to 6
  390 : a(i,1) = 1 :rem struisvogel op start
  400 next i
  410 r = r + 1
  420 return
  440 rem *** bewerking ***
  450 x = 1
  460 for i = 1 to 6
  470 : a(i,1) = a(i,1) + rnd(0) * 3
  480 : if a(x,1) > a(i,1) then 500
  490 : x = i :rem wisselen
  500 next i
  510 rem ** de finish gehaald ? **
  520 h = 0
  530 if a(x,1) < 32 then 550
  540 h = 1 :rem race geeindigd
  550 return
  570 rem *** uitvoer ***
  580 rem cls :rem scherm wissen
  581 print"{clr}"
  590 print "*** struisvogel race ***"
  600 print "race-nummer ";r;tab(17)" ingezet :";l;
  610 print "totaal ";b
  620 print "ingezet op struisvogelnr.";k;b$(k)
  630 print
  640 print "  !--!--!--!--!--!--!--!--!--!--!"
  650 for i = 1 to 6
  660 : d$ = left$("finish", i)
  670 : d$ = right$(d$,1)
  680 : e$ = left$("123456",i)
  690 : e$ = right$(e$,1)
  700 : y=int(a(i,1) + 0.5)
  710 : if y > 32 then 740
  720 : print tab(y)e$; :rem struisvogelnr.
  730 : if y > 32 then 770
  740 : print tab(32)d$;
  750 : if y < 32 then 770
  760 : print tab(y)e$; :rem struisvogelnr.
  770 : d$ = "<-"
  780 : if x=i then 800
  790 : d$ = ""
  800 : print tab(35)d$
  810 next i
  820 print "  !--!--!--!--!--!--!--!--!--!--!"
  830 return
  850 rem *** resultaat ***
  860 rem ** verloren ? **
  870 z = l * -1
  880 b$ = "verloren : "
  890 if x <> k then 940
  900 z = l * a(k,2) :rem uitkering
  910 b$ = "gewonnen : "
  920 b = b + z
  930 rem ** uitvoer **
  940 gosub 580
  950 print "koerswinnaar is nummer";x;b$(x)
  960 print b$;abs(z)
  970 print "nog een koers <ja/nee> ";
  980 input c$
  990 c$ = left$(c$,1)
 1000 h = 0
 1010 if c$ = "n" then 1040
 1020 h = 1
 1030 if c$ <> "j" then 970
 1040 if b > 0 then 1070
 1050 print "alles verloren !"
 1060 h = 0
 1070 return
 1090 rem **** stuurmodule ***
 1100 rem *** initialiseren ***
 1110 gosub 100
 1120 rem *** invoer ***
 1130 gosub 200
 1140 if k = 0 then 1230
 1150 rem *** uitvoer ***
 1160 gosub 580
 1170 rem *** bewerking ***
 1180 gosub 450
 1190 if h = 0 then 1160
 1200 rem *** resultaat ***
 1210 gosub 870
 1220 if h = 1 then 1130
 1230 end
