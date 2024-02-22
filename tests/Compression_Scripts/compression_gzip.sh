#!/bin/bash
function GZIP_COMPRESSION_UNSORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME
rm $IN_FILE.gz

{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -$LEVEL $IN_FILE; } 2>$IN_FILE_SHORT_NAME-gzip_l$LEVEL.txt  

{ ls $IN_FILE* -la -ltr | grep \.gz$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-gzip_size_l$LEVEL.txt  

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c $IN_FILE.gz >$IN_FILE_SHORT_NAME-gunzip.fa ; } 2>$IN_FILE_SHORT_NAME-gunzip_l$LEVEL.txt  

{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \unzip.fa$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-gunzip_size_l$LEVEL.txt 

rm *unzip.fa

}


function GZIP_COMPRESSION_SORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME

rm sort_fanalysis_$sorting_type-$IN_FILE.gz
{ /bin/time -f "TIME\t%e\tMEM\t%M"  gzip -k -$LEVEL sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_gzip_l$LEVEL-$sorting_type.txt

{ ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.gz$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_gzip_size_l$LEVEL-$sorting_type.txt  

{ /bin/time -f "TIME\t%e\tMEM\t%M" gunzip -c sort_fanalysis_$sorting_type-$IN_FILE.gz >sort_fanalysis_$IN_FILE_SHORT_NAME-$sorting_type-gunzip.fa ; } 2>$IN_FILE_SHORT_NAME-sort_fa_gunzip_l$LEVEL-$sorting_type.txt 

{ ls sort_fanalysis_$IN_FILE_SHORT_NAME-$sorting_type* -la -ltr | grep \unzip.fa$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_gunzip_size_l$LEVEL-$sorting_type.txt 

rm *unzip.fa

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
#General Use Compressors
levels_array=("1" "4" "7" "9")
program=("" "fasta_analysis")
#levels_array=("1")
#gzip
# #rm "data_gzip.csv"
# rm data_gzip-${INPUT_FILE[m]}-${sorting_types[n]}.csv
rm *.gz
#execution mode


if [[ $sorted_compression -eq 1 ]]; then
for((i=0; i<${#levels_array[@]}; i++)); do

  GZIP_COMPRESSION_SORTED $INPUT_FILE ${levels_array[i]} $sorting_types;
done
else
for((i=0; i<${#levels_array[@]}; i++)); do

  GZIP_COMPRESSION_UNSORTED $INPUT_FILE ${levels_array[i]} $sorting_types;
done

fi

# PLOT_GZIP "data_gzip-$INPUT_FILE_SHORT_NAME"

#rm *unzip.fasta
#   m=$((m+1))
#  done
#done 

