#!/usr/bin/env gnuplot

# Data path and parameters
path="/Users/sandro/Documents/Dados_simulacao/MVS_SS_Invar"
plot_path = "/Users/sandro/Documents/Projetos/MVS_SS_Invar/results/plots"

n_clones=96

# Settings
# set terminal wxt size 800,300
set terminal pngcairo size 800,300
set output plot_path."/semi-major_axis_inner.png"

set title "Semimajor axis of the inner planets" font "Helvetica, 14"
set xlabel "Time [a]" font "Helvetica, 14"
set ylabel "Semimajor Axis [au]" font "Helvetica, 14"
set xrange [0:1e7]
set yrange [0.3:1.6]
set label "Mercury" left at 1e6, 0.44
set label "Venus"   left at 1e6, 0.78
set label "Earth"   left at 1e6, 1.06
set label "Mars"    left at 1e6, 1.58

# Define functions
filename_mer(n) = sprintf(path."/MVS_SS_Invar-%d/Mercury.txt", n)
filename_ven(n) = sprintf(path."/MVS_SS_Invar-%d/Venus.txt", n)
filename_ear(n) = sprintf(path."/MVS_SS_Invar-%d/Earth.txt", n)
filename_mar(n) = sprintf(path."/MVS_SS_Invar-%d/Mars.txt", n)

# Plots
plot for [i=1:n_clones] filename_mer(i) u 1:2  w l notitle,\
     for [i=1:n_clones] filename_ven(i) u 1:2  w l notitle,\
     for [i=1:n_clones] filename_ear(i) u 1:2  w l notitle,\
     for [i=1:n_clones] filename_mar(i) u 1:2  w l notitle

# Wait
pause -1 "Presse <ENTER> to exit"
    