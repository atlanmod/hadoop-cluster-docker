set xlabel "nodes"
set ylabel "Time(s)"


set yrange [0:1400]

set ytics nomirror


plot "timings-dag-5000-average.txt" using (log($1)):2:xtic(1) title "5000v" with lines, \
     "timings-dag-10000-average.txt" using (log($1)):2:xtic(1) title "10000v" with lines, \
     "timings-dag-20000-average.txt" using (log($1)):2:xtic(1) title "20000v" with lines, \
     "timings-dag-50000-average.txt" using (log($1)):2:xtic(1) title "50000v" with lines, \
     "timings-dag-100000-average.txt" using (log($1)):2:xtic(1) title "100000v" with lines  

set size 1, 0.45
set terminal postscript portrait enhanced color dashed lw 1 "Helvetica" 14
set output "exp3-average.ps"
replot
set term pop
