   10 rem *** zeeslag ***
   20 rem random :rem dit statement kan vervallen
   30 dim a(20,10),b(5,3),a$(12),b$(5)
   40 data 5,2, 4,3, 3,4, 3,5, 2,6
   50 data " . ",-v-,-k-,-f-,-m-,-d-
   60 data " * ",*v*,*k*,*f*,*m*,*d*
   70 data vliegdekschip,kruiser,fregat
   80 data mijnenveger,duikboot
   90 goto 3440
  110 rem *** initialiseren ***
  120 restore :rem datapointer vooraan
  130 for i=1 to 20
  140 : for j=1 to 10
  150 :   if i<>1 then 170
  160 :   read x :rem dummy lezen
  170 :   a(i,j)=1 :rem start waarde
  180 : next j
  190 : if i > 12 then 240
  200 : read a$(i) :rem symbolen
  210 : if i > 5 then 240
  220 : b(i,1)=0
  230 : b(i,2)=0
  240 : if i < 16 then 260
  250 : read b$(i-15) :rem namen schepen
  260 next i
  270 restore
  280 for i=1 to 5
  290 : read b(i,3),x
  300 next i
  310 rem ** variabelen op nul **
  320 t=0 :rem gezonken schepen
  330 return
  350 rem *** speelveld computer opbouwen ***
  360 restore
  370 for x=1 to 5
  380 : read y,v :rem grootte en soort
  390 : z=int(rnd(0)*(10-y)+1)
  400 : l=int(rnd(0)*10+1)
  410 : h=int(rnd(0)*2)
  420 : if h=1 then 470
  430 : rem *** wisselen van z met l **
  440 : m=z
  450 : z=l
  460 : l=m
  470 : q=0 :rem deel 1 mat a
  480 : gosub 540
  490 : if m=1 then 390
  500 next x
  510 return
  530 rem *** controle op schip ***
  540 r1=z-1
  550 r2=z+y
  560 k1=l-1
  570 k2=l+1
  580 if h=1 then 610
  590 r2=z+1
  600 k2=l+y
  610 m=0 :rem hulpvariabele
  620 for i=r1 to r2
  630 : for j=k1 to k2
  640 :   if i<1  or j< 1 then 700
  650 :   if i>10 or j>10 then 700
  660 :   if a(i+q*10,j)=1 then 700
  670 :   i=r2 :rem lus-teller op maximum
  680 :   j=k2 :rem lus-teller op maximum
  690 :   m=1  :rem fout
  700 : next j
  710 next i
  720 if m=1 then 890
  730 rem ** schip plaatsen **
  740 r1=z
  750 r2=z+y-1
  760 k1=l
  770 k2=l
  780 if h=1 then 810
  790 r2=z
  800 k2=l+y-1
  810 m=1
  820 if k2>10 or r2>10 then 890
  830 for i=r1 to r2
  840 : for j=k1 to k2
  850 :   a(i+q*10,j)=v
  860 : next j
  870 next i
  880 m=0
  890 return
  910 rem *** speelveld speler opbouwen ***
  920 restore
  930 rem ** zee speler schoonvegen **
  940 for i=11 to 20
  950 : for j=1 to 10
  960 :   a(i,j)=1
  970 : next j
  980 next i
  990 s=1
 1000 q=1 :rem deel 2 mat a
 1010 for x=1 to 5
 1020 : read y,v
 1030 : d$=" -vlootopbouw-"
 1040 : rem ** zee afdrukken **
 1050 : gosub 1300
 1060 : print "geef x en y-coord van ";b$(x);
 1070 : print " lengte ";y;
 1080 : input l,z
 1090 : if l<1 or l>10 then 1030
 1100 : if z<1 or z>10 then 1030
 1110 : print "ligging noord-zuid of west-oost ";
 1120 : input a$
 1130 : a$=left$(a$,1)
 1140 : h=1
 1150 : if a$="n" then 1190
 1160 : h=0
 1170 : if a$<>"w" then 1110
 1180 : rem ** controle op schip **
 1190 : gosub 540
 1200 : if m=1 then 1030
 1210 next x
 1220 rem ** zee-afdruk **
 1230 gosub 1300
 1240 print "nog wijzigen <ja/nee> ";
 1250 input a$
 1260 if left$(a$,1)="j" then 920
 1270 return
 1290 rem *** zee-afdruk ***
 1300 rem cls :rem scherm wissen
 1301 print "{clr}"
 1310 a$="- computer -"
 1320 if q=0 then 1340
 1330 a$="- speler -"
 1340 print "*** zeeslag ***   ";d$
 1350 print tab(15)a$
 1360 if k=0 then 1380
 1370 print tab(k*3-2+5)"*"
 1380 print tab(6)"1  2  3  4  5  6  ";
 1390 print "7  8  9  10"
 1400 for i=1 to 10
 1410 : print i;
 1420 : if i<>r then 1440
 1430 : print tab(3)"*";
 1440 : print tab(5);
 1450 : p=i+q*10
 1460 : for j=1 to 10
 1470 :   a$=" . "
 1480 :   if a(p,j)=-1 then 1520
 1490 :   if q=s then 1510
 1500 :   if a(p,j)<7 then 1520
 1510 :   a$=a$(a(p,j))
 1520 :   print a$;
 1530 : next j
 1540 : print
 1550 next i
 1560 return
 1580 rem *** verwerking schot computer ***
 1590 gosub 1300
 1600 x=a(r+q*10,k)-1
 1610 a(r+q*10,k)=a(r+q*10,k)+6
 1620 print "is er iets geraakt <ja/nee>";
 1630 input d$
 1640 if left$(d$,1)="n" then 1660
 1650 if left$(d$,1)<>"j" then 1620
 1660 if x=0 then 1980
 1670 restore
 1680 for i=1 to x
 1690 : read y,v
 1700 next i
 1710 b(x,2)=b(x,2)+1 :rem schoten schip
 1720 z=r*100+k
 1730 if b(x,2)=1 then 1750
 1740 if z>b(x,1) then 1770
 1750 b(x,1)=z
 1760 rem ** schip uitgeschakeld ? **
 1770 if y<>b(x,2) then 1980
 1780 rem ** schip gezonken **
 1790 rem * omgeving schip merken *
 1800 r=int(b(x,1)/100)
 1810 k=b(x,1)-r*100
 1820 r2=r+y-1
 1830 k2=k
 1840 if r2>10 then 1860
 1850 if a(r2+q*10,k2)=v+6 then 1880
 1860 r2=r
 1870 k2=k+y-1
 1880 for i=r-1 to r2+1
 1890 : for j=k-1 to k2+1
 1900 :   if i< 1 or j< 1 then 1940
 1910 :   if i>10 or j>10 then 1940
 1920 :   if a(i+q*10,j)<>1 then 1940
 1930 :   a(i+q*10,j)=-1
 1940 : next j
 1950 next i
 1960 b(x,2)=b(x,2)*-1
 1970 t=t+1 :rem totaal gezonken schepen
 1980 return
 2000 rem *** schot speler ***
 2010 q=0
 2020 s=1
 2030 r=0
 2040 k=0
 2050 d$=""
 2060 gosub 1300
 2070 print "geef x , y - coord ";
 2080 input k,r
 2090 if k<1 or k>10 then 2070
 2100 if r<1 or r>10 then 2070
 2110 d$="plons"
 2120 if a(r,k)>6 then 2190
 2130 x=a(r,k)
 2140 a(r,k)=x+6
 2150 if x=1 then 2200
 2160 b(x-1,3)=b(x-1,3)-1
 2170 d$=b$(x-1)
 2180 rem ** zee-afdruk **
 2190 d$="-resultaat- "+d$
 2200 gosub 1300
 2210 h=0
 2220 for i=1 to 5
 2230 : if b(i,3)<>0 then 2250
 2240 : h=h+1
 2250 next i
 2260 if h<>5 then 2280
 2270 t=100 :rem speler gewonnen
 2280 return
 2300 rem *** onbekend h=1 ***
 2310 rem ** kolom ? **
 2320 a1=int(rnd(0)*10+1)
 2330 a2=10
 2340 b1=1
 2350 b2=10
 2360 l=int(rnd(0)*2)
 2370 h=-1
 2380 if l=0 then 2490
 2390 rem ** regel ? **
 2400 b1=a1
 2410 a1=1
 2420 if h=-1 then 2490
 2430 a2=a1
 2440 a1=1
 2450 if l=0 then 2490
 2460 b2=b1
 2470 b1=1
 2480 a2=10
 2490 h=h+1
 2500 for i=a1 to a2
 2510 : for j=b1 to b2
 2520 :   if a(i+q*10,j)<0 or a(i+q*10,j)>6 then 2580
 2530 :   r=i
 2540 :   k=j
 2550 :   h=9
 2560 :   i=a2
 2570 :   j=b2
 2580 : next j
 2590 next i
 2600 if h=0 then 2430
 2610 return
 2630 rem *** schot computer ***
 2640 q=1
 2650 s=1
 2660 h=1
 2670 restore
 2680 for i=1 to 5
 2690 : read y,v
 2700 : if b(i,2)<0 or b(i,1)=0 then 2760
 2710 : x=i
 2720 : h=2
 2730 : if b(i,2)=1 then 2750
 2740 : h=3
 2750 : i=5
 2760 next i
 2770 on h gosub 2320,3130,2850
 2780 s=1
 2790 d$=""
 2800 gosub 1590
 2810 return
 2830 rem *** beschadigd h = 3 ***
 2840 rem * vertikaal *
 2850 l=0 :rem hulpvar.
 2860 h=0 :rem hulpvar j
 2870 r=int(b(x,1)/100)
 2880 k=b(x,1)-r*100
 2890 for i=r-y to r+y
 2900 : if i<0 or i>10 then 2940
 2910 : if a(i+q*10,k)<>v+6 or i=r then 2940
 2920 : h=1
 2930 : i=r+y
 2940 next i
 2950 if h=1 then 2980 :rem verticaal
 2960 rem * horizontaal *
 2970 l=1
 2980 x=1
 2990 i=r
 3000 j=k
 3010 x=x*-1
 3020 i=i+(h*x)
 3030 j=j+(l*x)
 3040 if i< 1 or j< 1 then 3010
 3050 if i>10 or j>10 then 3100
 3060 if a(i+q*10,j)=v+6 then 3020
 3070 if a(i+q*10,j)=-1 or a(i+q*10,j)=7 then 3010
 3080 r=i
 3090 k=j
 3100 return
 3120 rem *** aangeschoten h = 2 ***
 3130 r1=int(b(x,1)/100)
 3140 k1=b(x,1)-r1*100
 3150 for i=r1-1 to r1+1
 3160 : for j=k1-1 to k1+1
 3170 :   if i< 1 or j<1 then 3260
 3180 :   if i>10 or j>10 then 3260
 3190 :   if i<>r1 and j<>k1 then 3260
 3200 :   if i=r1 and j=k1 then 3260
 3210 :   if a(i+q*10,j)=-1 or a(i+q*10,j)=7 then 3260
 3220 :   r=i
 3230 :   k=j
 3240 :   i=r1+1
 3250 :   j=k1+1
 3260 : next j
 3270 next i
 3280 return
 3300 rem *** resultaat ***
 3310 d$="speler "
 3320 q=0
 3330 s=1
 3340 if t=100 then 3380
 3350 q=1
 3360 s=0
 3370 d$="computer "
 3380 d$=d$+"gewonnen"
 3390 gosub 1300
 3400 return
 3420 rem **** stuurmodule ****
 3430 rem *** initialiseren ***
 3440 gosub 120
 3450 rem *** speelveld opbouwen computer ***
 3460 gosub 360
 3470 rem *** speelveld speler opbouwen ***
 3480 gosub 920
 3490 rem *** schot speler ***
 3500 gosub 2010
 3510 if t=100 then 3560
 3520 rem *** schot computer ***
 3530 gosub 2640
 3540 if t<5 then 3500
 3550 rem *** resultaat ***
 3560 gosub 3310
 3570 end
