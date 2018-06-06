#!/usr/bin/env bash
#--------------------------------------------------------------------
# Purpose:
#   Extraction of the planets' data from SWIFT's binary output file
# 
# Data          Programmer          Descripton change
# ====          ==========          =================
# 2017-08-07    S. R. DeSouza       Original Code
#--------------------------------------------------------------------

# Paths
# follow_path
follow_path="/home/sandro/Programas/Swift/tools/"

# Data path
data_path="/home/sandro/Documentos/Dados_simulacao/MVS_SS_Circ_Invar"

# Prefix simulation
prefix="MVS_SS_Circ_Invar-"

# List of the planets' names
planets=(Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune)
planets_index=(-2 -3 -4 -5 -6 -7 -8 -9)

# Change to data dir
cd $data_path

for j in $(ls -d $prefix*)
do 
    cd $j
    cp $follow_path/follow_swift.x .
    for ((i=0;i<${#planets[@]};i++))
    do
        echo -e "${planets_index[$i]}\n1" | ./follow_swift.x &> /dev/null
        mv follow.out ${planets[$i]}.txt
    done
    rm follow_swift.x
    cd ..
    echo "finish $j"
done


