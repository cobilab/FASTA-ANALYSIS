#!/bin/bash

function BZIP2_COMPRESSION_UNSORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -$LEVEL -f -k $IN_FILE ; } 2> $IN_FILE_SHORT_NAME-bzip2_l$LEVEL.txt  

mv $IN_FILE.bz2 $IN_FILE_SHORT_NAME-c_b.fa.bz2

{ ls $IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.bz2$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-bzip2_size_l$LEVEL.txt  

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d $IN_FILE_SHORT_NAME-c_b.fa.bz2 ; } 2>$IN_FILE_SHORT_NAME-bzip2_d_l$LEVEL.txt   

{ ls $IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.fa$ |awk '{print $5;}' ; } >  $IN_FILE_SHORT_NAME-bzip2_d_size_l$LEVEL.txt 

rm *-c_b.fa

}

function BZIP2_COMPRESSION_SORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3"

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME
{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -$LEVEL -f -k sort_fanalysis_$sorting_type-$IN_FILE ; } 2> $IN_FILE_SHORT_NAME-sort_fa_bzip2_l$LEVEL-$sorting_type.txt  

mv sort_fanalysis_$sorting_type-$IN_FILE.bz2 sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-c_b.fa.bz2

{ ls sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.bz2$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_bzip2_size_l$LEVEL-$sorting_type.txt 

{ /bin/time -f "TIME\t%e\tMEM\t%M" bzip2 -f -k -d sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-c_b.fa.bz2 ; } 2>$IN_FILE_SHORT_NAME-sort_fa_bzip2_d_l$LEVEL-$sorting_type.txt  

{ ls sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-c_b* -la -ltr | grep \.fa$ |awk '{print $5;}'; } >  $IN_FILE_SHORT_NAME-sort_fa_bzip2_d_size_l$LEVEL-$sorting_type.txt 

rm *-c_b.fa

}

# sorting_types=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
# INPUT_FILE=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"

# declare -p sorting_types INPUT_FILE

sorting_types=$1
INPUT_FILE=$2
#n=$3
test=$3
sorted_compression=$4
#for ((n=0; n<${#sorting_types[@]}; n++)); do
#for ((m=0; m<${#INPUT_FILE[@]}; m++)); do
# m=0
# while (($m < ${#INPUT_FILE[@]} )); do
# bzip2
levels_array=("1" "4" "7" "9")
program=("" "fasta_analysis")
# rm "data_bzip2.csv"
rm *.bz2
 #levels_array=("1")
#execution mode
if [[ $sorted_compression -eq 1 ]]; then
 for ((i=0; i<${#levels_array[@]}; i++)); do

  BZIP2_COMPRESSION_SORTED $INPUT_FILE ${levels_array[i]} $sorting_types;
 done

else
for ((i=0; i<${#levels_array[@]}; i++)); do

  BZIP2_COMPRESSION_UNSORTED $INPUT_FILE ${levels_array[i]} $sorting_types;
 done

fi

 # PLOT_BZIP2 "data_bzip2-$INPUT_FILE_SHORT_NAME"
# m=$((m+1))
# done
#done
