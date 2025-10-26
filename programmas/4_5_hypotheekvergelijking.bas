   10 rem *** hypotheek-vergelijking ***
   20 rem -- data bedrag/1000, notarisk., taxatiek. --
   30 data  50, 904,118   , 60, 957,123.90,70,1010,144.55
   40 data  80,1063,165.20, 90,1116,185.85
   50 data 100,1269,206.50,110,1334,227.15
   60 data 120,1399,247.80,130,1464,268.45
   70 data 140,1528,289.10,150,1593,309.75
   80 data 160,1658,330.40,170,1723,351.05
   90 data 180,1787,371.70,190,1852,392.35
  100 data200,1917,413   ,210,1982,433.65
  110 data220,2046,454.30,230,2111,474.95
  120 data240,2176,495.60,  0,0,0
  130 data 38 :rem royementskosten
  140 data "tarieven per 15 april 1982"
  150 dim a$(4)
  160 goto 2220
  170 :
  180 rem *** initialiseren ***
  190 a$(1)=" halfjaar "
  200 a$(2)=" maand "
  210 a$(3)=" procent "
  220 a$(4)=" maanden "
  230 return
  240 :
  250 rem *** financiele gegevens i ***
  260 rem ** gegevens oude hypotheek **
  270 rem cls
  271 print "{clr}"
  280 print "*** hypotheek-vergelijking ***"
  290 print "-- gegevens over huidige hypotheek --"
  300 print
  310 print "wat is het restant schuldbedrag   ";
  320 input h1
  330 print "tegen welk percentage             ";
  340 input r1
  350 print "halfjaarlijks=1 maandelijks=2 ";
  360 input k1
  370 if k1<1 or k1>2 then 350
  380 m1=6
  390 if k1=1 then 410
  400 m1=1
  410 print "bedrag aan aflossing + rente per";a$(k1);" ";
  420 input b1
  430 print "boete berekend 0.b.v. perc.=1 mnd=2  ";
  440 input t1
  450 if t1<1 or t1>2 then 430
  460 print "hoeveel"; a$(2+t1) ; "boete              ";
  470 input l1
  480 print "boete over hoeveel procent v.d. schuld ";
  490 input q1
  500 return
  510 :
  520 rem *** financiele gegevens ii ***
  530 rem ** nieuwe hypotheek **
  540 rem cls :rem scherm wissen
  541 print "{clr}"
  550 print "*** hypotheek-vergelijking ***"
  560 print "-- gegevens over nieuwe hypotheek --"
  570 print
  580 print "hoeveel wilt u extra aflossen ";
  590 input h3
  600 print "wat wordt de looptijd ";
  610 input n2
  620 print "wat is het nieuwe rente-perc. ";
  630 input r2
  640 print "betaling per halfj=1 per mnd=2 ";
  650 input k2
  660 if k2<1 or k2>2 then 640
  670 m2=6
  680 if k2=1 then 700
  690 m2=1
  700 print "hoeveel proc. afsluitprovisie ";
  710 input a2
  720 print "taxatie-kosten ja=1 nee=2 ";
  730 input d2
  740 if d2<1 or d2>2 then 720
  750 return
  760 :
  770 rem *** boeteberekening 0.b.v. mnd ***
  780 x=h1/100*q1/100
  790 b=l1/12*x*r1
  800 b=int(b*100+0.5)/100
  810 return
  820 :
  830 rem *** boeteberekening 0.b.v. perc ***
  840 x=h1/100*q1/100
  850 b=l1*x
  860 b=int(b*100+0.5)/100
  870 return
  880 :
  890 rem *** provisiekosten ***
  900 v=a2/100*(h1-h3)
  910 return
  920 :
  930 rem *** notaris- en taxatiekosten ***
  940 restore
  950 x=-1
  960 if x=-1 then 1000
  970 x1=x
  980 y1=y
  990 z1=z
 1000 read x,y,z
 1010 x=x*1000
 1020 if x=0 and z=0 then 1160
 1030 if h1-h3>x then 960
 1040 j=y
 1050 p=z
 1060 if h1=x then 1110
 1070 j=(y-y1)/10000
 1080 p=(z-z1)/10000
 1090 j=y1+int(j*((h1-h3)-x1)+0.5) :rem notaris
 1100 p=z1+int(p*((h1-h3)-x1)+0.5) :rem taxatie
 1110 if d2=1 then 1140
 1120 p=0
 1130 rem ** dummy lezen **
 1140 read x,y,z
 1150 if x<>0 and z<>0 then 1140
 1160 read i,d$ :rem royementsk. + tekst
 1170 return
 1180 :
 1190 rem *** nieuwe annuiteit ***
 1200 m=2
 1210 if k=1 then 1230
 1220 m=12
 1230 a=(r/m)/100
 1240 x=(1+a)^(n2*m)
 1250 s=1-1/x
 1260 s=(h*a)/s
 1270 return
 1280 :
 1290 rem *** kostenberekening ***
 1300 rem *** boete ***
 1310 on t1 gosub 840,780
 1320 rem *** provisie ***
 1330 gosub 900
 1340 rem *** notaris + taxatiekosten ***
 1350 gosub 940
 1360 f=b+v+j+p+i :rem tot.kosten
 1370 return
 1380 :
 1390 rem *** voordeel omsluiten **
 1400 h=h1-h3
 1410 r=r2
 1420 k=k2
 1430 gosub 1200
 1440 b2=s
 1450 g=b1/m1-b2/m2 :rem voordeel per mnd
 1460 return
 1470 :
 1480 rem *** maandenterugverdien tijd ***
 1490 if g<0 then 1550
 1500 e=f/g
 1510 if int(f/g)-e=0 then 1550
 1520 e=int(e+1)
 1530 e1=int(e/12)
 1540 e2=e-e1*12
 1550 return
 1560 :
 1570 :
 1580 rem *** positioneren bedrag ***
 1590 b$="--"
 1600 w=z-int(z)
 1610 a$=str$(int(z))
 1620 if w=0 then 1670
 1630 w=int(w*100+0.5)
 1640 b$=str$(w)
 1650 b$="00" + right$(b$,len(b$)-1)
 1660 b$=right$(b$,2)
 1670 a$=a$+","+b$
 1680 if z<>0 then 1700
 1690 a$="-  "
 1700 z=10-len(a$)
 1710 return
 1720 :
 1730 rem *** wachten ***
 1740 print "wilt u doorgaan <ja/nee> ";
 1750 input d$
 1760 d$=left$(d$,1)
 1770 return
 1780 :
 1790 rem *** uitvoer ***
 1800 rem cls
 1801 print "{clr}"
 1810 print "*** hypotheek-vergelijking ***"
 1820 print
 1830 print "- kosten : ";d$
 1840 print
 1850 z=b:gosub 1590
 1860 print "1. boete...........:";tab(28+z)a$
 1870 z=j:gosub 1590
 1880 print "2. notariskosten...:";tab(28+z)a$
 1890 z=p:gosub 1590
 1900 print "3. taxatiekosten...:";tab(28+z)a$
 1910 z=i:gosub 1590
 1920 print "4. royementskosten.:";tab(28+z)a$
 1930 z=v:gosub 1590
 1940 print "5. provisiekosten..:";tab(28+z)a$
 1950 z=f:gosub 1590
 1960 print tab(26) "------------"
 1970 print "totale kosten......:";tab(28+z)a$
 1980 print tab(26) "============"
 1990 gosub 1740
 2000 if d$="n" then 2180
 2010 rem cls :rem scherm wissen
 2011 print "{clr}"
 2020 print "*** hypotheek vergelijking ***"
 2030 print
 2040 print "==> opnieuw afsluiten van de hypotheek <=="
 2050 print
 2060 z=h1-h3:gosub 1590
 2070 print "nieuw hypotheekbedrag :";tab(29+z)a$
 2080 print
 2090 z=b2:gosub 1590
 2100 print "nieuwe annuiteit per"+a$(k2);tab(29+z)a$
 2110 z=b2/m2:gosub 1590
 2120 print "bruto-last per maand :";tab(29+z)a$
 2130 z=g:gosub 1590
 2140 print "voordeel per maand:";tab(29+z)a$
 2150 if g<0 then 2170
 2160 print "terugverdientijd ";e1;"jaar en ";e2;"maanden"
 2170 print
 2180 return
 2190 :
 2200 rem **** stuurmodule ****
 2210 rem *** initialiseren ***
 2220 gosub 190
 2230 rem *** financiele gegevens 1 ***
 2240 gosub 270
 2250 rem *** financiele gegevens ii ***
 2260 gosub 540
 2270 rem *** kostenberekening ***
 2280 gosub 1310
 2290 rem *** voordeel/annuiteit ***
 2300 gosub 1400
 2310 rem *** terugverdientijd ***
 2320 gosub 1490
 2330 rem *** uitvoer ***
 2340 gosub 1800
 2350 end
