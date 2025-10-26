   10 rem *** video-catalogus ***
   20 dim a$(6),b(10,3),b$(10),c(3,2),c$(3,2)
   30 goto 1910
   40 :
   50 rem *** initialiseren ***
   60 a$(1)="titel"
   70 a$(2)="acteur/actrice"
   80 a$(3)="genre"
   90 a$(4)="band"
  100 a$(5)="start-teller"
  110 a$(6)="eind-teller"
  120 return
  130 :
  140 rem *** invoer ***
  150 rem ** kop afdrukken **
  160 gosub 900
  170 for i=1 to 3
  180 : print i;tab(3)"= ";a$(i);
  190 : print tab(21)i+3;tab(24)"= ";a$(i+3)
  200 next i
  210 rem ** ingegeven voorwaarden afdrukken **
  220 gosub 960
  230 rem ** voorwaarden **
  240 gosub 290
  250 if h=1 then 160
  260 return
  270 :
  280 rem *** voorwaarden ***
  290 h=0 :rem stuurvariabele
  300 x=t+1
  310 if x>10 then 570
  320 b(x,1)=1 :rem of=1 en=2 !
  330 if x=1 then 380
  340 print "of=1 en=2 stop=0 ";
  350 input b(x,1)
  360 if b(x,1)<0 or b(x,1)>2 then 340
  370 if b(x,1)=0 then 570
  380 print "geef rubriek-naam of nummer ";
  390 input a$
  400 a$=left$(a$,1)
  410 b(x,2)=val(a$)
  420 if b(x,2)>0 and b(x,2)<7 then 510
  430 rem ** zoeken naam rubriek **
  440 for i=1 to 6
  450 : if left$(a$(i),1)<>a$ then 480
  460 : b(x,2)=i
  470 : i=6 :rem maximum lus
  480 next i
  490 if b(x,2)=0 then 380
  500 rem ** conditie **
  510 print "waaraan dient ";a$(b(x,2));" te voldoen ";
  520 input b$(x)
  530 if b(x,2)<4 then 550
  540 b(x,3)=val(b$(x))
  550 t=x
  560 h=1
  570 return
  580 :
  590 rem *** voorbewerking ***
  600 t=0
  610 y=1
  620 restore :rem datapointer vooraan
  630 for i=1 to 10
  640 : for j=1 to 3
  650 :   b(i,j)=0
  660 : next j
  670 : b$(i)=""
  680 next i
  690 p=0 :rem aantal records
  700 rem ** print mat schoonvegen **
  710 for i=1 to 3
  720 : for j=1 to 2
  730 :   c(i,j)=0
  740 :   c$(i,j)=""
  750 : next j
  760 next i
  770 return
  780 :
  790 rem *** record lezen ***
  800 rem ** uit interne data-file **
  810 h=0 :rem eof ?
  820 read c$
  830 if c$="999" then 870
  840 c$(1,2)=c$
  850 h=1 :rem not (eof)
  860 read c$(2,2),c$(3,2),c(1,2),c(2,2),c(3,2)
  870 return
  880 :
  890 rem *** kop afdrukken ***
  900 rem cls :rem scherm wissn
  901 print"{clr}"
  910 print "*** catalogus - video ***"
  920 print
  930 return
  940 :
  950 rem *** voorwaarden afdrukken ***
  960 if t=0 then 1070
  970 print "reeds opgenomen voorwaarden !"
  980 for i=1 to t
  990 : a$=" "
 1000 : if i=1 then 1040
 1010 : a$="en"
 1020 : if b(i,1)=2 then 1040
 1030 : a$="of"
 1040 : print i;tab(4)a$;tab(7)a$(b(i,2));
 1050 : print tab(24)" = ";b$(i)
 1060 next i
 1070 return
 1080 :
 1090 rem *** bewerking ***
 1100 rem ** record lezen **
 1110 gosub 810
 1120 if h=0 then 1320
 1130 r=0 :rem stuurvariabele
 1140 rem ** voorwaarden toetsen **
 1150 for i=1 to t
 1160 : k=b(i,2) :rem rubrieknummer
 1170 : v=0 :rem ** stuurvariabele
 1180 : l=1 :rem alfanumeriek
 1190 : if k<4 then 1210
 1200 : l=2
 1210 : on l gosub 1660,1720
 1220 : s=r+v
 1230 : r=1 :rem voldoet
 1240 : if s>=b(i,1) then 1260
 1250 : r=0 :rem voldoet niet
 1260 next i
 1270 if r=0 then 1320
 1280 rem ** regel afdrukken **
 1290 gosub 1360
 1300 rem ** schuiven **
 1310 gosub 1570
 1320 return
 1330 :
 1340 rem *** uitvoer ***
 1350 rem ** kop afdrukken **
 1360 gosub 900
 1370 p=p+1
 1380 print "aantal geaccepteerde records ";p
 1390 print
 1400 rem ** afdruk **
 1410 for j=1 to 2
 1420 : if c(1,j)=0 and c(3,j)=0 then 1490
 1430 : for i=1 to 3
 1440 :   print a$(i);tab(19)": ";c$(i,j)
 1450 : next i
 1460 : for i=1 to 3
 1470 :   print a$(i+3);tab(19)":";c(i,j)
 1480 : next i
 1490 next j
 1500 print
 1510 print "er kunnen meer records voldoen !"
 1520 y=1
 1530 gosub 1770
 1540 return
 1550 :
 1560 rem *** opschuiven ***
 1570 for i=1 to 3
 1580 : c$(i,1)=c$(i,2)
 1590 : c(i,1)=c(i,2)
 1600 : c$(i,2)=""
 1610 : c(i,2)=0
 1620 next i
 1630 return
 1640 :
 1650 rem *** alfanumeriek ? ***
 1660 z=len(b$(i))
 1670 if b$(i)<>left$(c$(k,2),z) then 1690
 1680 v=1 :rem voldoet
 1690 return
 1700 :
 1710 rem *** numeriek ? ***
 1720 if b(i,3)<>c(k-3,2) then 1740
 1730 v=1 :rem voldoet
 1740 return
 1750 :
 1760 rem *** wachten ****
 1770 a$="wilt u doorgaan"
 1780 if y=1 then 1800
 1790 a$="wilt u nog een selectie"
 1800 print a$;"  <ja/nee> ";
 1810 input a$
 1820 a$=left$(a$,1)
 1830 y=1 :rem doorgaan
 1840 if a$="j" then 1870
 1850 y=0
 1860 if a$<>"n" then 1770
 1870 return
 1880 :
 1890 rem **** stuurmodule ****
 1900 rem *** initialiseren ***
 1910 gosub 60
 1920 rem *** voorbewerking ***
 1930 gosub 600
 1940 rem *** invoer ***
 1950 gosub 160
 1960 rem *** bewerking ***
 1970 gosub 1110
 1980 if h<>0 and y<>0 then 1970
 1990 rem *** nieuwe selectie ***
 2000 y=2
 2010 gosub 1770
 2020 if a$="j" then 1930
 2030 end
 2040 :
 2050 rem ------------------------------
 2060 :
 2070 rem ***** interne data-file *****
 2080 data "schone slaapster","greta garbo",musical
 2090 data 1,0,1200
 2100 data "king kong","william holden",actie
 2110 data 1,1201,1700
 2120 data "final count down","kirk douglas",oorlog
 2130 data 3,0,1200
 2140 data "you only live twice","roger moore",actie
 2150 data 1,1701,3500
 2160 data "999"
