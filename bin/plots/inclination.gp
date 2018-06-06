#!/usr/bin/env gnuplot

# Data path and parameters
path = "/home/sandro/Documentos/Dados_simulacao/MVS_SS_Circ_Invar"
plot_path = "/home/sandro/Documentos/Projetos/MVS_SS_Invar/results/plots"

n_clones=96

# Settings
#set terminal wxt size 800,700
set terminal pngcairo size 800,600
set output plot_path."/inclination.png"
set multiplot layout 4,2 rowsfirst
set yrange [0.0:1.0]

set macros
# Placement of the planet names labels in the graphs
POS = "at graph 0.85,0.9 font ',8'"
# x- and ytics for each row resp. column
NOXTICS = "set format x ''; unset xlabel"
XTICS = "set xlabel 'Time - [1e7 a]'"
NOYTICS = "set format y ''; unset ylabel"
#YTICS = "set format y '%.3f'; set ylabel 'e'"
YTICS = "set format y '%.3f'; set ytics (0.0, 0.2, 0.4, 0.6, 0.8);\
         set ylabel 'i [deg]'"
# Margins for each row resp. column
TMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.725"
M1MARGIN = "set tmargin at screen 0.725; set bmargin at screen 0.55"
M2MARGIN = "set tmargin at screen 0.55; set bmargin at screen 0.375"
BMARGIN = "set tmargin at screen 0.375; set bmargin at screen 0.20"
LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"

filename(i, j) = sprintf(path."/MVS_SS_Circ_Invar-%d/%s.txt", i, j)

# --- GRAPH a
set label 1 'Mercury' @POS
@NOXTICS; @YTICS
@TMARGIN; @LMARGIN
plot for [i=1:n_clones] filename(i, "Mercury")  u 1:4  w l notitle
# --- GRAPH b
set label 1 'Venus' @POS
@NOXTICS; @NOYTICS
@TMARGIN; @RMARGIN
plot for [i=1:n_clones] filename(i, "Venus")    u 1:4  w l notitle
# --- GRAPH c
set label 1 'Earth' @POS
@NOXTICS; @YTICS
@M1MARGIN; @LMARGIN
plot for [i=1:n_clones] filename(i, "Earth")    u 1:4  w l notitle
# --- GRAPH d
set label 1 'Mars' @POS
@NOXTICS; @NOYTICS
@M1MARGIN; @RMARGIN
plot for [i=1:n_clones] filename(i, "Mars")     u 1:4  w l notitle
# --- GRAPH e
set label 1 'Jupiter' @POS
@NOXTICS; @YTICS
@M2MARGIN; @LMARGIN
plot for [i=1:n_clones] filename(i, "Jupiter")  u 1:4  w l notitle
# --- GRAPH f
set label 1 'Saturn' @POS
@NOXTICS; @NOYTICS
@M2MARGIN; @RMARGIN
plot for [i=1:n_clones] filename(i, "Saturn")    u 1:4  w l notitle
# --- GRAPH g
set label 1 'Uranus' @POS
@XTICS; @YTICS
@BMARGIN; @LMARGIN
plot for [i=1:n_clones] filename(i, "Uranus")    u 1:4  w l notitle
# --- GRAPH h
set label 1 'Neptune' @POS
@XTICS; @NOYTICS
@BMARGIN; @RMARGIN
plot for [i=1:n_clones] filename(i, "Neptune")     u 1:4  w l notitle

# Wait
# pause -1 "Presse <ENTER> to exit"
    
unset multiplot
