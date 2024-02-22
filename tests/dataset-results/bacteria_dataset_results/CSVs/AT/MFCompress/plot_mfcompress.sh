 #!/bin/bash
 
 function PLOT_MFCOMPRESS(){
  #rm *.csv
partitions_array=("1" "4" "8")
#MFCOMPRESS_CSV="data_mfcompress"
NAF_synthetic_CSV=$1
NAF_real_CSV=$2
SORTING_TYPE=$3
  # IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fasta//g')
  # echo $IN_FILE_SHORT_NAME
# echo "$(sort -t$',' -k 9 $MFCOMPRESS_CSV.csv)" > "$MFCOMPRESS_CSV.csv"

#for ((i=0; i<${#MFCOMPRESS_CSV[@]}; i++)); do
#Build CSV for each partition
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE.csv | grep -w "1" | awk -F, '$3==1'  > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1.csv
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE.csv| grep -w "4" | awk -F, '$3==4' > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4.csv
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE.csv | grep -w "8" | awk -F, '$3==8' > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8.csv
 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE.csv | grep -w "1" | awk -F, '$3==1'  > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1.csv
 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE.csv| grep -w "4" | awk -F, '$3==4' > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4.csv
 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE.csv | grep -w "8" | awk -F, '$3==8' > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8.csv

#Build CSV for each sorting algorithm
cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE.csv | grep -e "fasta_analysis" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-fasta_analysis.csv
cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE.csv| grep -e "sortmf" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-sortmf.csv
cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" | grep -e "mfcompress" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-not_sorted.csv

cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE.csv | grep -e "fasta_analysis" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-fasta_analysis.csv
cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE.csv| grep -e "sortmf" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-sortmf.csv
cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE.csv | grep -v -e "fasta_analysis" | grep -v -e "sortmf" | grep -e "mfcompress" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-not_sorted.csv


#Build CSV combining partition with sorting algorithm
#MFCOMPRESS_CSV="data_jarvis3"
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1.csv | grep -e "sortmf" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1_sortmf.csv
 echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1_sortmf.csv)" > "data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1_sortmf.csv"
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4.csv | grep -e "sortmf" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4_sortmf.csv
  echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4_sortmf.csv)" > "data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4_sortmf.csv"
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8.csv | grep -e "sortmf" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8_sortmf.csv
  echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8_sortmf.csv)" > "data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8_sortmf.csv"
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1.csv | grep -e "fasta_analysis" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1_fasta_analysis.csv
 echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1_fasta_analysis.csv)" > "data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-1_fasta_analysis.csv"
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4.csv | grep -e "fasta_analysis" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4_fasta_analysis.csv
 echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4_fasta_analysis.csv)" > "data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-4_fasta_analysis.csv"
 cat data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8.csv | grep -e "fasta_analysis" > data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8_fasta_analysis.csv
 echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8_fasta_analysis.csv)" > "data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-8_fasta_analysis.csv"

 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1.csv | grep -e "sortmf" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1_sortmf.csv
 echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1_sortmf.csv)" > "data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1_sortmf.csv"
 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4.csv | grep -e "sortmf" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4_sortmf.csv
  echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4_sortmf.csv)" > "data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4_sortmf.csv"
 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8.csv | grep -e "sortmf" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8_sortmf.csv
  echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8_sortmf.csv)" > "data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8_sortmf.csv"
 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1.csv | grep -e "fasta_analysis" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1_fasta_analysis.csv
 echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1_fasta_analysis.csv)" > "data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-1_fasta_analysis.csv"
 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4.csv | grep -e "fasta_analysis" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4_fasta_analysis.csv
 echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4_fasta_analysis.csv)" > "data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-4_fasta_analysis.csv"
 cat data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8.csv | grep -e "fasta_analysis" > data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8_fasta_analysis.csv
 echo "$(sort -t$',' -n -k 9 data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8_fasta_analysis.csv)" > "data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-8_fasta_analysis.csv"
#done

 for j in "${!partitions_array[@]}"; do

  #for l in "${!sorting_method[@]}"; do
  partition=${partitions_array[j]}
  plot_file="data-plot_mfcompress_${partitions_array[j]}.pdf"
  #echo $plot_file
  title="MFCompress with partition ${partitions_array[j]}"
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
        set yrange [-10:20]
        set xrange [0:2500]
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
        plot "data_mfcompress-$NAF_synthetic_CSV-$SORTING_TYPE-${partitions_array[j]}_fasta_analysis.csv" u 9:8 title "Synthetic Data" with linespoints linestyle count , "data_mfcompress-$NAF_real_CSV-$SORTING_TYPE-${partitions_array[j]}_fasta_analysis.csv" u 9:8 title "Real Data"  with linespoints linestyle count+1
         
EOF
   #point=$((point+1))
   #echo $point
 #done
done

 }



INPUT_FILE_1=$1
INPUT_FILE_2=$2
SORTING_TYPE=$3

INPUT_FILE_SHORT_NAME_1=$(echo $INPUT_FILE_1 | sed 's/.fa//g')
INPUT_FILE_SHORT_NAME_2=$(echo $INPUT_FILE_2 | sed 's/.fa//g')


 PLOT_MFCOMPRESS $INPUT_FILE_SHORT_NAME_1 $INPUT_FILE_SHORT_NAME_2 $SORTING_TYPE
