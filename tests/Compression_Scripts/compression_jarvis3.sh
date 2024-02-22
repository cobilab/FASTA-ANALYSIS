#!/bin/bash

function JARVIS3_COMPRESSION_UNSORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  PARTITION_MB="$4"
  sorting_type="$5"
  # SORTING_TYPE="$5"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME
  # PARTITION_MB=$(cat $PARTITION | sed 's/MB//g')
  # if [[ $PARTITION == "1GB" ]] then
  #   PARTITION_MB="1000"
  # fi

  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l $LEVEL --block $PARTITION --fasta -i $IN_FILE ; } 2>$IN_FILE_SHORT_NAME-$PARTITION_MB-l$LEVEL.txt
 
  { ls $IN_FILE* -la -ltr | grep \.tar$ | awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-size_$PARTITION_MB-l$LEVEL.txt
  
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l $LEVEL --fasta -i $IN_FILE.tar ;  } 2>$IN_FILE_SHORT_NAME-d_$PARTITION_MB-l$LEVEL.txt
 
  { ls $IN_FILE* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-size_d_$PARTITION_MB-l$LEVEL.txt
  
  rm *tar.out


}


function JARVIS3_COMPRESSION_SORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  PARTITION_MB="$4"
  sorting_type="$5"
  # SORTING_TYPE="$5"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME
  # PARTITION_MB=$(cat $PARTITION | sed 's/MB//g')
  # if [[ $PARTITION == "1GB" ]] then
  #   PARTITION_MB="1000"
  # fi
  # sort_fanalysis_AT-synthetic.fa
 # copy2-sort_fa_10-l2.txt
  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -l $LEVEL --block $PARTITION --fasta -i sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_$PARTITION_MB-l$LEVEL-$sorting_type.txt

  { ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.tar$ | awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_size_$PARTITION_MB-l$LEVEL-$sorting_type.txt

  { /bin/time -f "TIME\t%e\tMEM\t%M" ./JARVIS3.sh -d -l $LEVEL --fasta -i sort_fanalysis_$sorting_type-$IN_FILE.tar ;  } 2>$IN_FILE_SHORT_NAME-sort_fa_d_$PARTITION_MB-l$LEVEL-$sorting_type.txt

  { ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.tar.out$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_size_d_$PARTITION_MB-l$LEVEL-$sorting_type.txt

  rm *tar.out


}

# sorting_types=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
# INPUT_FILE=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"

# declare -p sorting_types INPUT_FILE
sorting_type=$1
INPUT_FILE=$2
#n=$3
test=$3
sorted_compression=$4
#for ((n=0; n<${#sorting_types[@]}; n++)); do
#for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
#JARVIS3

levels_array=("1" "2" "5" "8")
#levels_array=("15" "20" "25" "30")
# partitions_array=("10MB" "100MB" "1GB")
# partitions_in_mb=("10" "100" "1000")
partitions_array=("100MB")
partitions_in_mb=("100")
program=("" "fasta_analysis")
#partitions_array=("10MB")
#partitions_in_mb=("10")

rm *.tar
j=0

if [[ $sorted_compression -eq 1 ]]; then
for ((i=0; i<${#levels_array[@]}; i++)); do
j=0
 while (($j < ${#partitions_array[@]} )); do
    JARVIS3_COMPRESSION_SORTED $INPUT_FILE ${levels_array[i]} ${partitions_array[j]} ${partitions_in_mb[j]} $sorting_type;

  j=$((j+1))
 done
done
else
for ((i=0; i<${#levels_array[@]}; i++)); do
j=0
 while (($j < ${#partitions_array[@]} )); do
    JARVIS3_COMPRESSION_UNSORTED $INPUT_FILE ${levels_array[i]} ${partitions_array[j]} ${partitions_in_mb[j]} $sorting_type;

  j=$((j+1))
 done
done
fi
   #  PLOT_JARVIS3 "data_jarvis3-$INPUT_FILE_SHORT_NAME" $partitions_array
# #    m=$((m+1))
# #   done
# # #done  
