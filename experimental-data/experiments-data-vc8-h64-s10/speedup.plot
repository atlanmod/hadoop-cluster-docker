set xlabel "Number of machines"
set ylabel "Speedup(X-times)"

set xrange [0:10]
set yrange [0:12]

set ytics nomirror


plot "timings-dag-10000-max-speedup.txt" using 1:2  title "max-10000v" with lines, \
     "timings-dag-20000-max-speedup.txt" using 1:2  title "max-20000v" with lines, \
	"timings-dag-50000-max-speedup.txt" using 1:2  title "max-50000v" with lines, \
"timings-dag-10000-speedup.txt" using 1:2  title "avg-10000v" with lines, \
     "timings-dag-20000-speedup.txt" using 1:2  title "avg-20000v" with lines, \
	"timings-dag-50000-speedup.txt" using 1:2  title "avg-50000v" with lines, 
   

set size 1, 0.45
set terminal postscript portrait enhanced color dashed lw 1 "Helvetica" 14
set output "h64-vc8-10s-speedup.ps"
replot
set term pop
