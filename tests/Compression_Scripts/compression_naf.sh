#!/bin/bash

function NAF_COMPRESSION_UNSORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";
  SORTING_ALGORITHM="$4";


  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME


if [[ $LEVEL -gt 17 ]]; then
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna -$LEVEL --level $LEVEL $IN_FILE ; } 2>$IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
else
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level $LEVEL $IN_FILE ; } 2>$IN_FILE_SHORT_NAME-naf_l$LEVEL.txt
fi

{ ls $IN_FILE* -la -ltr | grep \.naf$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-naf_size_l$LEVEL.txt

echo "NAF Level" $LEVEL "decompression" 

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  $IN_FILE.naf -o $IN_FILE_SHORT_NAME-naf.fa ; } 2>$IN_FILE_SHORT_NAME-unnaf_l$LEVEL.txt

{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \naf.fa$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-unnaf_size_l$LEVEL.txt

rm *naf.fa
}

function NAF_COMPRESSION_SORTED() {
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";
  SORTING_ALGORITHM="$4";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME

  echo "NAF Level" $LEVEL "compression"
if [[ $LEVEL -gt 17 ]]; then
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna -$LEVEL --level $LEVEL sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_naf_l$LEVEL-$sorting_type.txt
else
{ /bin/time -f "TIME\t%e\tMEM\t%M"  ennaf --strict --temp-dir tmp/ --dna --level $LEVEL sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_naf_l$LEVEL-$sorting_type.txt
fi

{ ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.naf$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_naf_size_l$LEVEL-$sorting_type.txt

echo "NAF Level" $LEVEL "decompression" 

{ /bin/time -f "TIME\t%e\tMEM\t%M" unnaf  sort_fanalysis_$sorting_type-$IN_FILE.naf -o sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME-naf.fa ; } 2>$IN_FILE_SHORT_NAME-sort_fa_unnaf_l$LEVEL-$sorting_type.txt

{ ls sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME* -la -ltr | grep \naf.fa$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_unnaf_size_l$LEVEL-$sorting_type.txt

rm *naf.fa

}
#!/usr/bin/env bash

#sorting_types=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
#INPUT_FILE=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
sorting_type=$1
input_file=$2

#declare -p sorting_types INPUT_FILE
#sorting_types=$1
#INPUT_FILE=$2
#n=$3
test=$3
sorted_compression=$4

#for ((n=0; n<${#sorting_types[@]}; n++)); do
#NAF
 levels_array=("1" "8" "15" "22")
  program=("" "fasta_analysis")
#levels_array=("8")
rm *.naf
m=0

#echo "$sorted_compression"

#while (($m < ${#INPUT_FILE[@]} )); do
#if [[ $LEVEL -gt 17 ]]; then
if [[ $sorted_compression -eq 1 ]]; then

 for ((i=0; i<${#levels_array[@]}; i++)); do
    INPUT_FILE_SHORT_NAME=$(ls -1 $input_file | sed 's/.fa//g')
    NAF_COMPRESSION_SORTED $input_file ${levels_array[i]} $sorting_type ;
#INPUT_FILE_SHORT_NAME$(ls -1 synthetic.fasta | sed 's/.fasta//g')
#NAF_COMPRESSION "synthetic.fasta" ${levels_array[i]} ;
    echo "level" ${levels_array[i]} "completed"
 done
 
else
 for ((i=0; i<${#levels_array[@]}; i++)); do
    INPUT_FILE_SHORT_NAME=$(ls -1 $input_file | sed 's/.fa//g')
    NAF_COMPRESSION_UNSORTED $input_file ${levels_array[i]} $sorting_type ;
#INPUT_FILE_SHORT_NAME$(ls -1 synthetic.fasta | sed 's/.fasta//g')
#NAF_COMPRESSION "synthetic.fasta" ${levels_array[i]} ;
    echo "level" ${levels_array[i]} "completed"
 done
fi

 # m=$((m+1))
 # done
#done
