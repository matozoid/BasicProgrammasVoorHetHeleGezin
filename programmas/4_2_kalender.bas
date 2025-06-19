10 rem *** kalender ***
20 dim a(7,6)
30 goto 1070
40 :
50 rem *** initialiseren ***
60 c$ = "3032323323"
70 d$ = "madiwodovrzazo"
80 g$ = "janfebmrtaprmeijunjulaugsepoktnovdec "
90 return
100 :
110 rem *** maandberekening ***
120 rem ** bepaling lengte van de maand **
130 e$ = left$(c$,m)
140 d = 28 + val(right$(e$,1))
150 rem ** bepaling schrikkeljaar **
160 if y / 4 - int(y/4) <> 0 then 200
170 if m = 2000 or m <> 2 then 200
180 d = d + 1
190 rem *** bepaling eerste v.d. maand ***
200 gosub 910
210 rem *** mat a opbouwen ***
220 h = 1
230 for j = 1 to 6
240 for i = 1 to 7
250 p = i + (j - 1) * 7
260 a(i,j) = 0
270 if p < a or h > d then 300
280 a(i,j) = h
290 h = h + 1
300 next i
310 next j
320 rem ** bepaling naam van de maand **
330 h$ = left$(g$, m * 3)
340 h$ = right$(h$,3)
350 return
360 :
370 rem *** uitvoer ***
380 cls                :rem scherm wissen
390 print " *** kalender ***"
400 print "maand ";h$;y
410 print
420 for i = 1 to 7
430 e$ = left$(d$, 2 * i)
440 print right$(e$,2);
450 for j = 1 to 6
460 if a(i,j) = 0 then 480
470 print tab(j * 4 + 3) a(i,j);
480 next j
490 print
500 next i
510 return
520 :
530 rem *** invoer ***
540 cls                :rem scherm wissen
550 print "*** kalender ***"
560 print
570 print "welk jaar -4 cijfers- <stop = 0> ";
580 input y
590 if y = 0 then 640
600 if y < 1700 or y > 2200 then 570
610 print "welke maand    <alle = 0> ";
620 input k
630 if k < 0 or k > 12 then 610
640 return
650 :
660 rem *** besturing ***
670 for z = 1 to 12
680 m = z
690 if k = 0 then 710
700 m = k
710 gosub 110
720 rem ** uitvoer **
730 gosub 380
740 rem ** invoer ii **
750 gosub 820
760 if k = 0 then 780
770 z = 12           :rem uit lus
780 next z
790 return
800 :
810 rem *** invoer ii ***
820 print "wilt u doorgaan  <ja/nee> ";
830 input l$
840 l$ = left$(l$,1)
850 if l$ = "j" then 860
860 if l$ <> "n" then 820
870 k = 1
880 return
890 :
900 rem *** bepaling eerste v.d. maand ***
910 p = m
920 l = y
930 if p > 2 then 960
940 p = p + 12
950 l = l - 1
960 e = int(l/100)
970 r = l - e * 100
980 a = int(2.6001 * (p-2) - 0.2)
990 a = a + 1 + r + int(r/4) + int(e/4) - 2 * e
1000 a = a - int(a/7) * 7
1010 if a <> 0 then 1030
1020 a = 7
1030 return
1040 :
1050 rem **** stuurmodule ****
1060 rem *** initialiseren ***
1070 gosub 60
1080 rem *** invoer ***
1090 gosub 540
1100 if y = 0 then 1140
1110 rem *** besturing ***
1120 gosub 670
1130 if l$ = "j" then 1090
1140 end