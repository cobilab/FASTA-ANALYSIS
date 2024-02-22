
#!/bin/bash

function PLOT_JARVIS3(){
#rm *.csv
partitions_array=("10mb" "100mb" "1gb")
JARVIS3_synthetic_CSV=$1
JARVIS3_real_CSV=$2
SORTING_TYPE=$3


  # IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  # echo $IN_FILE_SHORT_NAME
#echo "$(sort -t$',' -n -k9 $JARVIS_CSV.csv)" > "$JARVIS_CSV.csv"

#Build CSV for each partition
#for ((i=0; i<${#JARVIS_CSV[@]}; i++)); do
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE.csv | grep -w "10MB" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb.csv
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE.csv | grep -w "100MB" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb.csv
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE.csv | grep -w "1GB" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb.csv

 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE.csv | grep -w "10MB" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb.csv
 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE.csv | grep -w "100MB" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb.csv
 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE.csv | grep -w "1GB" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb.csv

#Build CSV for each sorting algorithm
cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE.csv | grep -e "fasta_analysis" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-fasta_analysis.csv
cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE.csv | grep -e "sortmf" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-sortmf.csv
cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" | grep -e "JARVIS3" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-not_sorted.csv

cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE.csv | grep -e "fasta_analysis" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-fasta_analysis.csv
cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE.csv | grep -e "sortmf" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-sortmf.csv
cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" | grep -e "JARVIS3" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-not_sorted.csv


#Build CSV combining partition with sorting algorithm
#JARVIS_CSV="data_jarvis3"
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb.csv | grep -e "sortmf" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb_sortmf.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb_sortmf.csv)" > "data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb_sortmf.csv"
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb.csv | grep -e "sortmf" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb_sortmf.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb_sortmf.csv)" > "data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb_sortmf.csv"
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb.csv | grep -e "sortmf" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb_sortmf.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb_sortmf.csv)" > "data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb_sortmf.csv"
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb.csv | grep -e "fasta_analysis" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb_fasta_analysis.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb_fasta_analysis.csv)" > "data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-10mb_fasta_analysis.csv"
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb.csv | grep -e "fasta_analysis" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb_fasta_analysis.csv
   echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb_fasta_analysis.csv)" > "data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-100mb_fasta_analysis.csv"
 cat data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb.csv | grep -e "fasta_analysis" > data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb_fasta_analysis.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb_fasta_analysis.csv)" > "data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-1gb_fasta_analysis.csv"


 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb.csv | grep -e "sortmf" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb_sortmf.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb_sortmf.csv)" > "data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb_sortmf.csv"
 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb.csv | grep -e "sortmf" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb_sortmf.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb_sortmf.csv)" > "data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb_sortmf.csv"
 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb.csv | grep -e "sortmf" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb_sortmf.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb_sortmf.csv)" > "data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb_sortmf.csv"
 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb.csv | grep -e "fasta_analysis" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb_fasta_analysis.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb_fasta_analysis.csv)" > "data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-10mb_fasta_analysis.csv"
 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb.csv | grep -e "fasta_analysis" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb_fasta_analysis.csv
   echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb_fasta_analysis.csv)" > "data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-100mb_fasta_analysis.csv"
 cat data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb.csv | grep -e "fasta_analysis" > data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb_fasta_analysis.csv
  echo "$(sort -t$',' -n -k9 data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb_fasta_analysis.csv)" > "data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-1gb_fasta_analysis.csv"

#done



 for j in "${!partitions_array[@]}"; do

  #for l in "${!sorting_method[@]}"; do
  partition=${partitions_array[j]}
  plot_file="jarvis3-plot_${partitions_array[j]}-$SORTING_TYPE.pdf"
  #echo $plot_file
  title="JARVIS3.sh, partition ${partitions_array[j]} sorted by $SORTING_TYPE"
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
        set yrange [-2:10]
        set xrange [30:100]
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
       # set multiplot layout 1,2
        count=12
      #  plot sorting_points u 7:8 w points ls count notitle
        plot "data_jarvis3-$JARVIS3_synthetic_CSV-$SORTING_TYPE-${partitions_array[j]}_fasta_analysis.csv" u 9:8 title "Synthetic Data" with linespoints linestyle count , "data_jarvis3-$JARVIS3_real_CSV-$SORTING_TYPE-${partitions_array[j]}_fasta_analysis.csv" u 9:8 title "Real Data" with linespoints linestyle count+1
       # count=count + 1
       # plot 
       # count=count + 1
         
EOF
   #point=$((point+1))
   #echo $point
 #done
done

#done

}

INPUT_FILE_1=$1
INPUT_FILE_2=$2
SORTING_TYPE=$3

INPUT_FILE_SHORT_NAME_1=$(echo $INPUT_FILE_1 | sed 's/.fa//g')
INPUT_FILE_SHORT_NAME_2=$(echo $INPUT_FILE_2 | sed 's/.fa//g')


 PLOT_JARVIS3 $INPUT_FILE_SHORT_NAME_1 $INPUT_FILE_SHORT_NAME_2 $SORTING_TYPE
