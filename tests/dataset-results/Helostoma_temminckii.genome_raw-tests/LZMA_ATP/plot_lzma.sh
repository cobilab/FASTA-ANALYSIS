#!/bin/bash

 function PLOT_LZMA(){
  #LZMA_CSV="data_lzma"
LZMA_synthetic_CSV=$1
LZMA_real_CSV=$2
SORTING_TYPE=$3
  # IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  # echo $IN_FILE_SHORT_NAME


#or ((i=0; i<${#LZMA_CSV[@]}; i++)); do
#Build CSV for each sorting algorithm
cat data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE.csv | grep -e "fasta_analysis" > data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-fasta_analysis.csv
echo "$(sort -t$',' -n -k 8 data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-fasta_analysis.csv)" > "data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-fasta_analysis.csv"
cat data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE.csv| grep -e "sortmf" > data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-sortmf.csv
echo "$(sort -t$',' -n -k 8 data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-sortmf.csv)" > "data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-sortmf.csv"
cat data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" > data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-not_sorted.csv
echo "$(sort -t$',' -n -k 8 data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-not_sorted.csv)" > "data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-not_sorted.csv"

cat data_lzma-$LZMA_real_CSV-$SORTING_TYPE.csv | grep -e "fasta_analysis" > data_lzma-$LZMA_real_CSV-$SORTING_TYPE-fasta_analysis.csv
echo "$(sort -t$',' -n -k 8 data_lzma-$LZMA_real_CSV-$SORTING_TYPE-fasta_analysis.csv)" > "data_lzma-$LZMA_real_CSV-$SORTING_TYPE-fasta_analysis.csv"
cat data_lzma-$LZMA_real_CSV-$SORTING_TYPE.csv| grep -e "sortmf" > data_lzma-$LZMA_real_CSV-$SORTING_TYPE-sortmf.csv
echo "$(sort -t$',' -n -k 8 data_lzma-$LZMA_real_CSV-$SORTING_TYPE-sortmf.csv)" > "data_lzma-$LZMA_real_CSV-$SORTING_TYPE-sortmf.csv"
cat data_lzma-$LZMA_real_CSV-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" > data_lzma-$LZMA_real_CSV-$SORTING_TYPE-not_sorted.csv
echo "$(sort -t$',' -n -k 8 data_lzma-$LZMA_real_CSV-$SORTING_TYPE-not_sorted.csv)" > "data_lzma-$LZMA_real_CSV-$SORTING_TYPE-not_sorted.csv"
#done


 #for j in "${!partitions_array[@]}"; do

  #for l in "${!sorting_method[@]}"; do
 # partition=${partitions_array[j]}
  plot_file="data-plot_lzma-$SORTING_TYPE.pdf"
  #echo $plot_file
  title="LZMA sorting by $SORTING_TYPE"
  #gain_x=$(awk -F "\"*,\"*" '{print $8}' data_level_${levels_array[j]}.csv) 
  #cat ${level_input_file[j]}
  #point=0
   #while (($point < ${#sorting_method_points_l1[@]})); do
   #C:/gnuplot/bin/gnuplot.exe << EOF
  gnuplot << EOF
        reset
        set terminal pdfcairo enhanced color font 'Verdade,12'
        set datafile separator "," 
        set title "$title"
        set output "$plot_file"
        set style line 101 lc rgb '#000000' lt 1 lw 2 
        set border 3 front ls 101
        set tics nomirror out scale 0.01
        set key fixed right top vertical Right noreverse noenhanced autotitle nobox
        set style histogram clustered gap 1 title textcolor lt -1
        set xtics border in scale 0,0 nomirror #rotate by -60  autojustify
        set yrange [-10:10]
        set xrange [0:1000]
        set xtics auto
        set ytics auto # set ytics auto
        set key top right
        set style line 1 lc rgb '#990099'  pt 1 ps 0.6  # circle
        set style line 2 lc rgb '#004C99'  pt 2 ps 0.6  # circle
        set style line 3 lc rgb '#CCCC00'  pt 3 ps 0.6  # circle
        #set style line 4 lc rgb '#CC0000' lt 2 dashtype '---' lw 4 pt 5 ps 0.4 # --- red
        set style line 4 lc rgb 'red'  pt 7 ps 0.6  # circle 
        set style line 5 lc rgb '#009900'  pt 5 ps 0.6  # circle
        set style line 6 lc rgb '#990000'  pt 6 ps 0.6  # circle
        set style line 7 lc rgb '#009999'  pt 4 ps 0.6  # circle
        set style line 8 lc rgb '#99004C'  pt 8 ps 0.6  # circle
        set style line 9 lc rgb '#CC6600'  pt 9 ps 0.6  # circle
        set style line 10 lc rgb '#322152' pt 10 ps 0.6  # circle    
        set style line 11 lc rgb '#425152' pt 11 ps 0.6  # circle    
        set grid
        set ylabel "Gain"
        set xlabel "Compression Time(s)"
      #  set multiplot layout 1,2
        count=12
      #  plot sorting_points u 7:8 w points ls count notitle
        plot "data_lzma-$LZMA_synthetic_CSV-$SORTING_TYPE-fasta_analysis.csv" u 8:7 title "Synthetic Data" with linespoints linestyle count , "data_lzma-$LZMA_real_CSV-$SORTING_TYPE-fasta_analysis.csv" u 8:7 title "Real Data" with linespoints linestyle count+1
       # count=count + 1
       # plot 
       # count=count + 1
         
EOF
   #point=$((point+1))
   #echo $point
 #done
 }

 INPUT_FILE_1=$1
INPUT_FILE_2=$2
SORTING_TYPE=$3

INPUT_FILE_SHORT_NAME_1=$(echo $INPUT_FILE_1 | sed 's/.fa//g')
INPUT_FILE_SHORT_NAME_2=$(echo $INPUT_FILE_2 | sed 's/.fa//g')


 PLOT_LZMA $INPUT_FILE_SHORT_NAME_1 $INPUT_FILE_SHORT_NAME_2 $SORTING_TYPE
