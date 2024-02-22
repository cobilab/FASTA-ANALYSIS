
function CSV_BUILDER_MFCOMPRESS(){
  

  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  SORTING_ALGORITHM="$4";
  SORTING_TYPE="$5";
  test="$6"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME

if [[ $SORTING_ALGORITHM == "fasta_analysis" ]]; then  

program="MFCOMPRESS_$IN_FILE_SHORT_NAME-fasta_analysis"
level=$LEVEL
partition="$PARTITION"
#bytes=$(ls sort_fanalysis_$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
bytes=$(ls -la sort_fanalysis_$SORTING_TYPE-$IN_FILE_SHORT_NAME.fa |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_mfc_size_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mfc_size_l$LEVEL-p$PARTITION-t8.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_fa_mfc_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_mfc_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_fa_mfc_d_size_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_fa_mfc_d_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_fa_mfc_d_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$(echo $test)

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data_mfcompress-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

elif [[ $SORTING_ALGORITHM == "sortmf" ]]; then

program="MFCOMPRESS_$IN_FILE_SHORT_NAME-sortmf"
level=$LEVEL
partition="$PARTITION"
#bytes=$(ls sort_$IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
bytes=$(ls -la sort_$IN_FILE_SHORT_NAME.fa |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_mfc_size_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mfc_size_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-sort_mfc_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_mfc_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-sort_mfc_d_size_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-sort_mfc_d_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-sort_mfc_d_l$LEVEL-p$PARTITION-t8-$SORTING_TYPE.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$(echo $test)

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data_mfcompress-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

else

program="MFCOMPRESS_$IN_FILE_SHORT_NAME"
level=$LEVEL
partition="$PARTITION"
#bytes=$(ls $IN_FILE* -la -ltr | grep \.fasta$ |awk '{print $5;}')
bytes=$(ls -la $IN_FILE_SHORT_NAME.fa |awk '{print $5;}')
c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mfc_size_l$LEVEL-p$PARTITION-t8.txt)
original_c_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mfc_size_l$LEVEL-p$PARTITION-t8.txt)
bps_original=$(echo "scale=3; ($original_c_bytes * 8) / $bytes" | bc)
bps_final=$(echo "scale=3; ($c_bytes * 8) / $bytes" | bc)
#gain=$(echo "scale=3; ($c_bytes / $original_c_bytes)*100" | bc)
gain=$(echo "scale=3; (1-($c_bytes / $original_c_bytes))*100" | bc)
c_time=$(awk 'FNR ==1 {print $2}' $IN_FILE_SHORT_NAME-mfc_l$LEVEL-p$PARTITION-t8.txt)
c_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-mfc_l$LEVEL-p$PARTITION-t8.txt)
d_bytes=$(awk 'FNR ==1 {print $1}' $IN_FILE_SHORT_NAME-mfc_d_size_l$LEVEL-p$PARTITION-t8.txt)
d_time=$(awk 'FNR ==1 {print $2}'  $IN_FILE_SHORT_NAME-mfc_d_l$LEVEL-p$PARTITION-t8.txt)
d_mem=$(awk 'FNR ==1 {print $4}'  $IN_FILE_SHORT_NAME-mfc_d_l$LEVEL-p$PARTITION-t8.txt)
diff=0
if [ $bytes -eq $d_bytes ] 
 then
  diff=0
else
  diff=1
fi
run=$(echo $test)

printf $program | tee program_x
printf $bytes | tee bytes_x
printf $level | tee level_x
printf $partition | tee partition_x
printf $c_bytes | tee c_bytes_x
printf $bps_original | tee bps_original_x
printf $bps_final | tee bps_final_x
printf $gain | tee gain_x
printf $c_time | tee c_time_x
printf $c_mem | tee c_mem_x
printf $d_time | tee d_time_x
printf $d_mem | tee d_mem_x
printf $diff | tee diff_x
printf $run | tee run_x
 

file="data_mfcompress-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
$program,$level,$partition,$bytes,$c_bytes,$bps_original,$bps_final,$gain,$c_time,$c_mem,$d_time,$d_mem,$diff,$run
.
wq
EOF
}

fi

}


 function BUILD_CSV_HEADER_2(){

COMPRESSOR="$1";
 IN_FILE="$2";
 SORTING_TYPE="$3";

    IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME


file="data_$COMPRESSOR-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
"PROGRAM","LEVEL","PARTITION","BYTES","C_BYTES","BPS_original","BPS_final","GAIN","C_TIME(s)","C_RAM(GB)","D_TIME(s)","D_MEM(GB)","DIFF","RUN"
.
wq
EOF
}


file="data_$COMPRESSOR-$IN_FILE_SHORT_NAME-$SORTING_TYPE.csv"

{
ed -s "$file" <<EOF
1
i
"$COMPRESSOR DATA",
.
wq
EOF
}

}


sorting_type=$1
INPUT_FILE=$2
# n=$3
test=$3
#$1 sorting_types
#$2=INPUT_FILE

#for ((n=0; n<${#sorting_types[@]}; n++)); do
 #for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
m=0
# while (($m < ${#INPUT_FILE[@]} )); do
#MFC
 levels_array=("1" "2" "3")
 partitions_array=("4" "8")
  # levels_array=("3")
  #partitions_array=("1" "4" "8")
 program=("" "fasta_analysis")


#CSV_BUILDER_MFCOMPRESS
#rm data_mfcompress-${INPUT_FILE[m]}-${sorting_types[n]}.csv
  for ((i=${#levels_array[@]}-1; i>=0; i--))
  do
  for ((j=${#partitions_array[@]}-1; j>=0; j--))
   do
    for ((k=${#program[@]}-1; k>=0; k--))
     do
      CSV_BUILDER_MFCOMPRESS $INPUT_FILE ${levels_array[i]} ${partitions_array[j]} ${program[k]} $sorting_type $test

     done
    done
   done

    BUILD_CSV_HEADER_2 "mfcompress" $INPUT_FILE $sorting_type

  rm *mfc.d