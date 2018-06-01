#!/usr/bin/env gnuplot

# Data path and parameters
path="/Users/sandro/Documents/Dados_simulacao/MVS_SS_Invar"
plot_path = "/Users/sandro/Documents/Projetos/MVS_SS_Invar/results/plots"

n_clones=96

# Settings
# set terminal wxt size 800,300
set terminal pngcairo size 800,300
set output plot_path."/semi-major_axis_giant.png"

set title "Semimajor axis of the giant planets" font "Helvetica, 14"
set xlabel "Time [a]" font "Helvetica, 14"
set ylabel "Semimajor Axis [au]" font "Helvetica, 14"
set xrange [0:1e7]
set yrange [4.5:32.0]
set label "Jupiter" left at 1e6, 6.1
set label "Saturn"  left at 1e6, 10.3
set label "Uranus"  left at 1e6, 20.3
set label "Neptune" left at 1e6, 31.5

# Define functions
filename_jup(n) = sprintf(path."/MVS_SS_Invar-%d/Jupiter.txt", n)
filename_sat(n) = sprintf(path."/MVS_SS_Invar-%d/Saturn.txt", n)
filename_ura(n) = sprintf(path."/MVS_SS_Invar-%d/Uranus.txt", n)
filename_nep(n) = sprintf(path."/MVS_SS_Invar-%d/Neptune.txt", n)

# Plots
plot for [i=1:n_clones] filename_jup(i) u 1:2  w l notitle,\
     for [i=1:n_clones] filename_sat(i) u 1:2  w l notitle,\
     for [i=1:n_clones] filename_ura(i) u 1:2  w l notitle,\
     for [i=1:n_clones] filename_nep(i) u 1:2  w l notitle

# Wait
pause -1 "Presse <ENTER> to exit"
    