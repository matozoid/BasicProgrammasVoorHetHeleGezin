10 rem *** boter kaas en eieren ***
20 data 1,2,3,4,5,6,7,8,9,1,4,7,2,4,8
30 data 3,6,9,1,5,9,3,5,7
40 dim a(9),b(3)
50 goto 1350
60 :
70 rem *** initialiseren ***
80 for i = 1 to 9
90 a(i) = 0
100 next i
110 b = 0 : c = 0 : f = 0 : g = 10
120 a$ = "!---!---!---!"
130 :
140 return
150 :
160 rem *** tegenzet computer ***
170 rem ** beurt 1 computer **
180 p = 0 : c = c + 1 : g = g - 1
190 if c > 1 then 290
200 if a(7) = 9 then p = 3
210 if a(9) = 9 then p = 1
220 if a(3) = 9 then p = 1
230 if a(1) = 9 then p = 9
240 if p <> 0 then 540
250 p = 5
260 if a(p) = 0 then 290
270 p = 9
280 rem ** beurt 2 computer **
290 if b > 1 or p <> 0 then 330
300 p = 1
310 if a(1) = 0 and a(9) = 0 then 540
320 p = 3
330 if p <> 0 then 540
340 rem ** computer wint ? **
350 r = 1 : y = 1
360 gosub 930
370 if p <> 0 then 540
380 rem ** computer blokkeert **
390 r = 9 : y = 9
400 gosub 930
410 if p <> 0 then 540
420 rem ** nieuwe opening **
430 r = 1 : y = 0
440 gosub 930
450 if p <> 0 then 540
460 r = 0 : y = 1
470 gosub 930
480 if p <> 0 then 540
490 rem ** eerste de beste vrije plaats **
500 for i = 1 to 9
510 if a(i) <> 0 then 530
520 p = i : i = 9
530 next i
540 a(p) = 1
550 r = 1
560 gosub 1060
570 return
580 :
590 rem *** uitvoer speelbord ***
600 cls
610 print "*** boter kaas en eieren ***"
620 print
630 if c = 0 or g = 0 then 660
640 print "computer zet op veld ";p
650 print
660 print a$
670 for i = 0 to 2
680 for j = 1 to 3
690 p = i * 3 + j
700 b$ = str$(p)
710 if a(p) = 0 then 750
720 b$ = " o"
730 if a(p) = 1 then 750
740 b$ = " x"
750 print tab(j * 4 - 3)b$;
760 next j
770 print
780 print a$
790 next i
800 return
810 :
820 rem *** zet speler ***
830 print "welk veld kies je ";
840 input k
850 if k < 1 or k > 9 then 830
860 if a(k) <> 0 then 830
870 a(k) = 9
880 b = b + 1 : g = g - 1 : r = 9
890 gosub 1060
900 return
910 :
920 rem *** scanroutine ***
930 restore
940 for i = 1 to 8
950 read b(1),b(2),b(3)
960 for j = 1 to 3
970 if a(b(1)) <> 0 then 1000
980 if a(b(2)) <> r or a(b(3)) <> y then 1000
990 p = b(1) : j = 3 : i = 8
1000 x = b(1) : b(1) = b(2)
1010 b(2) = b(3) : b(3) = x
1020 next j
1030 next i
1040 return
1050 rem *** winnaar ? ***
1060 restore
1070 for i = 1 to 8
1080 read x,y,z
1090 if a(x) <> r then 1120
1100 if a(y) <> r or a(z) <> r then 1120
1110 f = r : g = 0 : i = 8
1120 next i
1130 return
1140 :
1150 rem *** wie begint ? ***
1160 print "wil jij beginnen <ja/nee> ";
1170 input b$
1180 b$ = left$(b$,1)
1190 h = 1
1200 if b$ = "n" then 1230
1210 if b$ <> "j" then 1160
1220 h = 0
1230 g = g - h
1240 return
1250 :
1260 rem *** resultaat ***
1270 if f = 0 then b$ = "gelijk spel."
1280 if f = 1 then b$ = "ik heb gewonnen"
1290 if f = 9 then b$ = "jij hebt gewonnen"
1300 print b$
1310 return
1320 :
1330 rem **** stuurmodule ****
1340 rem *** initialiseren ***
1350 gosub 80
1360 rem *** uitvoer speelbord ***
1370 gosub 600
1380 rem *** wie begint ? ***
1390 gosub 1160
1400 if h = 1 then 1470
1410 rem *** uitvoer speelbord ***
1420 gosub 600
1430 rem *** zet speler ***
1440 gosub 830
1450 if g <= 0 then 1500
1460 rem *** tegenzet computer ***
1470 gosub 180
1480 if f = 0 and g > 0 then 1420
1490 rem *** resultaat ***
1500 c = 0
1510 gosub 600
1520 gosub 1270
1530 end
