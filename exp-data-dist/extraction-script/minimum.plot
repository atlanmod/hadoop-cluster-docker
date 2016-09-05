set xlabel "mappers (splits)"
set ylabel "min time(s)"

set xrange [0:(log(9))]
set yrange [0:2600]

set ytics nomirror


plot "timings-dag-10000-min.txt" using (log($1)):2:xtic(1) title "10000v" with lines, \
     "timings-dag-20000-min.txt" using (log($1)):2:xtic(1)  title "200000v" with lines,
   

set size 1, 0.45
set terminal postscript portrait enhanced color dashed lw 1 "Helvetica" 14
set output "exp1-min.ps"
replot
set term pop
