# call this file using
# "gnuplot --persist filename.gp"

load "matplotlib_colors.gp"

set title "Computation Time: Zig vs. C - various FFT sizes using FFTW"

set terminal qt size 600, 400
set terminal qt pos 200, 200

set datafile separator ','
# set logscale y
set key top left
set xlabel 'log_2(N_{fft})'
set ylabel 'mean time'

set xrange [10:15];

# set xtics 1
# set ytics 1
# set mytics 1
set grid xtics ytics mytics linestyle 3 linewidth 1.4

ptSize = 2
LW = 1.5

plot \
"../results/fftw_zig.csv" using 9:2 with linespoints ls 1 lw LW \
pt 7 ps ptSize title "calling fftw library from Zig program", \
\
"../results/fftw_c.csv" using 9:2 with linespoints ls 2 lw LW \
pt 7 ps ptSize title "calling fftw library from C program"
