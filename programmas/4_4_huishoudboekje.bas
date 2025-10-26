   10 rem *** huishoudboekje ***
   20 dim a(9),b$(9)
   30 goto 1960
   40 :
   50 rem *** initialiseren ***
   60 b$(1)="levensmiddelen"
   70 b$(2)="vakantie / uitgaan"
   80 b$(3)="auto/motor/fiets"
   90 b$(4)="verzekeringen"
  100 b$(5)="energie en water"
  110 b$(6)="woonlasten"
  120 b$(7)="kleding"
  130 b$(8)="studie en overigen"
  140 b$(9)="overigen"
  150 return
  160 :
  170 rem *** invoer ***
  180 rem cls :rem scherm wissen
  181 print"{clr}"
  190 print "*** huishoudboekje ***"
  200 print
  210 print "0=stoppen"
  220 print "1=rekening over een bepaalde maand"
  230 print "2=rekening t/m geboekte datum"
  240 print "3=totalen over een bepaalde maand"
  250 print "4=totalen t/m geboekte datum"
  260 print
  270 print "wat is uw keuze ";
  280 input k
  290 if k=0 then 370
  300 if k<0 or k>4 then 180
  310 if k>2 then 340
  320 rem ** invoer rekening-nummer **
  330 gosub 400
  340 if k=2 or k=4 then 370
  350 rem ** invoer maand **
  360 gosub 530
  370 return
  380 :
  390 rem *** invoer rekeningnummer ***
  400 rem cls :rem scherm wissen
  401 print"{clr}"
  410 print "*** huishoudboekje ***"
  420 print
  430 print tab(4)"0 =  alle rekeningen"
  440 for i=1 to 9
  450 : print tab(3)i;tab(5)"=  ";b$(i)
  460 next i
  470 print "welk rekeningnummer kiest u ";
  480 input r
  490 if r<0 or r>9 then 470
  500 return
  510 :
  520 rem *** invoer maand ***
  530 print "welke maand kiest u ";
  540 input m
  550 if m<1 or m>12 then 530
  560 return
  570 :
  580 rem *** inlezen record uit interne data file ***
  590 h=0
  600 read n :rem rekeningnummer
  610 if n=999 then 730
  620 h=1 :rem nog geen eof
  630 read d,a$,b :rem datum, omschrijving, bedrag
  640 if n<1 or n>9 then 590
  650 if k=4 then 730
  660 if k=2 then 720
  670 rem ** bepaalde maand **
  680 j=int(d/10000)
  690 z=int((d-j*10000)/100)
  700 if z<>m then 590
  710 if k=3 then 730
  720 if g<>n then 590
  730 return
  740 :
  750 rem *** voorbewerking ***
  760 rem ** schoonvegen mat a **
  770 for i=1 to 9
  780 : a(i)=0
  790 next i
  800 rem ** variabelen op startwaarde zetten **
  810 s=0 :rem totaal generaal
  820 m=0 :rem maand alles
  830 r=0 :rem rekening alles
  840 p=0 :rem printregelteller
  850 restore :rem datapointer vooraan
  860 return
  870 :
  880 rem *** bewerking - totalen ***
  890 rem ** record lezen **
  900 gosub 590
  910 if h=0 then 950
  920 a(n)=a(n)+b :rem totaliseren
  930 s=s+b
  940 if h=1 then 900
  950 return
  960 :
  970 rem *** uitvoer - totalen ***
  980 rem cls :rem scherm wissen
  981 print"{clr}"
  990 print "*** huishoudboekje ***"
 1000 a$="t/m geboekte maand"
 1010 if k=4 then 1030
 1020 a$="over maand : "+str$(m)
 1030 print a$
 1040 print
 1050 for i=1 to 9
 1060 : b=a(i)
 1070 : rem ** percentage's **
 1080 : e=0
 1090 : if s=0 then 1120
 1100 : e=int(b/s*1000+0.5)/10
 1110 : rem ** positioneren bedrag **
 1120 : gosub 1240
 1130 : print i;tab(3) b$(i);tab(22+l)a$;
 1140 : print tab(33)e;tab(38)"%"
 1150 next i
 1160 print tab(20)"-------------"
 1170 if s=0 then 1210
 1180 b=s
 1190 gosub 1240
 1200 print tab(3) "totaal";tab(22+l)a$;tab(34)"100%"
 1210 return
 1220 :
 1230 rem *** positioneren bedrag ***
 1240 b$="--"
 1250 w=b-int(b) :rem getal achter komma
 1260 a$=str$(int(b))
 1270 if w=0 then 1320
 1280 w=int(w*100+0.5)
 1290 b$=str$(w)
 1300 b$="00"+right$(b$,len(b$)-1)
 1310 b$=right$(b$,2)
 1320 a$=a$+","+b$
 1330 if b<>0 then 1350
 1340 a$="-   "
 1350 l=10 - len(a$)
 1360 return
 1370 :
 1380 rem *** bewerking-rekening ***
 1390 for q=1 to 9
 1400 : restore :rem datapointer vooraan
 1410 : s=0
 1420 : p=0 :rem bladteller op startwaarde
 1430 : g=q
 1440 : if r=0 then 1470
 1450 : g=r
 1460 : rem ** record lezen **
 1470 : gosub 590
 1480 : if h=0 then 1550
 1490 : a(g)=a(g) + b
 1500 : s=s+b
 1510 : rem ** regel uitvoer **
 1520 : gosub 1660
 1530 : if h=1 then 1470
 1540 : rem ** totaalregel opbouwen **
 1550 : d=0
 1560 : a$="totaal rekening"
 1570 : b=s
 1580 : p=-9
 1590 : gosub 1660
 1600 : if r=0 and a$="j" then 1620
 1610 : q=10 :rem lus-teller maximaal
 1620 next q
 1630 return
 1640 :
 1650 rem *** regel afdrukken ***
 1660 if p<>0 and s<>0 then 1720
 1670 rem cls :rem scherm wissen
 1671 print"{clr}"
 1680 print "*** huishoudboekje ***"
 1690 print "rekeningnummer :";g;b$(g)
 1700 print
 1710 print " datum    omschrijving         bedrag"
 1720 if p>-1 then 1740
 1730 print tab(30) "----------"
 1740 if d=0 then 1760
 1750 print d; :rem datum
 1760 print tab(8) left$(a$,20); :rem omschrijving
 1770 rem ** positioneren bedrag **
 1780 gosub 1240
 1790 print tab(30+l)a% :rem bedrag
 1800 p=p+1
 1810 if p>0 and p<8 then 1860
 1820 print tab(30)"=========="
 1830 rem ** wachten **
 1840 gosub 1890
 1850 p=0
 1860 return
 1870 :
 1880 rem *** wachten ***
 1890 print "wilt u doorgaan <ja/nee> ";
 1900 input a$
 1910 a$=left$(a$,1)
 1920 return
 1930 :
 1940 rem **** stuurmodule ****
 1950 rem *** initialiseren ***
 1960 gosub 60
 1970 rem *** voorbewerking ***
 1980 gosub 770
 1990 rem *** invoer ***
 2000 gosub 180
 2010 if k=0 then 2130
 2020 if k>2 then 2050
 2030 rem *** bewerking-berekening ***
 2040 gosub 1390
 2050 if k<3 then 1980
 2060 rem *** bewerking-totalen ***
 2070 gosub 900
 2080 rem *** uitvoer totalen ***
 2090 gosub 980
 2100 rem *** wachten ***
 2110 gosub 1890
 2120 if a$="j" then 1980
 2130 end
 2140 :
 2150 :
 2160 rem *** dataregels ***
 2170 rem *format rekeningnr,datum,omschrijv.,bedrag *
 2180 data 1,830103,"edah",35.34
 2190 data 9,830112,"cadeau ann",12.75
 2200 data 6,830131,hypotheek,1100
 2210 data 7,830213,"jas peter",65
 2220 data 7,830216,"broek martine",60.05
 2230 data 5,830215,geb,325.75
 2240 data 8,830228,"cost accounting",75.05
 2250 data 4,830217,brandverzekering,120
 2260 data 999
