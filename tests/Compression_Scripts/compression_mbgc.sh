
#!/bin/bash

function MBGC_COMPRESSION_UNSORTED() {
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME

rm $IN_FILE_SHORT_NAME.mbgc

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -c=$LEVEL -i $IN_FILE $IN_FILE_SHORT_NAME.mbgc ; } 2>$IN_FILE_SHORT_NAME-mbgc_l$LEVEL.txt 

{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \.mbgc$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-mbgc_size_l$LEVEL.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d $IN_FILE_SHORT_NAME.mbgc mbgc_decompress_l$LEVEL ; } 2>$IN_FILE_SHORT_NAME-mbgc_d_l$LEVEL.txt 

#  mbgc -d $IN_FILE_SHORT_NAME.mbgc mbgc_decompress
#  mv mbgc_decompress/$IN_FILE_SHORT_NAME.fasta $IN_FILE_SHORT_NAME-mbgc.fasta 
#  mv sort_mbgc_decompress/sort_$IN_FILE_SHORT_NAME.fasta sort_$IN_FILE_SHORT_NAME-mbgc.fasta 
#  mv sort_fanalysis_mbgc_decompress/sort_fanalysis_$IN_FILE_SHORT_NAME.fasta sort_fanalysis_$IN_FILE_SHORT_NAME-mbgc.fasta 

cd mbgc_decompress_l$LEVEL
{ ls $IN_FILE_SHORT_NAME* -la -ltr | grep \.fa$ |awk '{print $5;}' ; } >  $IN_FILE_SHORT_NAME-mbgc_d_size_l$LEVEL.txt
cd ..
mv mbgc_decompress_l$LEVEL/$IN_FILE_SHORT_NAME-mbgc_d_size_l$LEVEL-$sorting_type.txt $IN_FILE_SHORT_NAME-mbgc_d_size_l$LEVEL.txt
#cd sort_mbgc_decompress_l$LEVEL
#{ ls sort_$IN_FILE_SHORT_NAME* -la -ltr | grep \fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt
#cd ..
#mv sort_mbgc_decompress_l$LEVEL/$IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt $IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt

rm -r mbgc_decompress_*
  
}


function MBGC_COMPRESSION_SORTED() {
  IN_FILE="$1";
  LEVEL="$2";
  sorting_type="$3";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME

rm sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME.mbgc

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -c=$LEVEL -i sort_fanalysis_$sorting_type-$IN_FILE sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME.mbgc ; } 2>$IN_FILE_SHORT_NAME-sort_fa_mbgc_l$LEVEL-$sorting_type.txt

{ ls sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME* -la -ltr | grep \.mbgc$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_mbgc_size_l$LEVEL-$sorting_type.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" mbgc -d sort_fanalysis_$sorting_type-$IN_FILE_SHORT_NAME.mbgc sort_fanalysis_mbgc_decompress_l$LEVEL ; } 2>$IN_FILE_SHORT_NAME-sort_fa_mbgc_d_l$LEVEL-$sorting_type.txt 

#  mbgc -d $IN_FILE_SHORT_NAME.mbgc mbgc_decompress
#  mv mbgc_decompress/$IN_FILE_SHORT_NAME.fasta $IN_FILE_SHORT_NAME-mbgc.fasta 
#  mv sort_mbgc_decompress/sort_$IN_FILE_SHORT_NAME.fasta sort_$IN_FILE_SHORT_NAME-mbgc.fasta 
#  mv sort_fanalysis_mbgc_decompress/sort_fanalysis_$IN_FILE_SHORT_NAME.fasta sort_fanalysis_$IN_FILE_SHORT_NAME-mbgc.fasta 

#cd sort_mbgc_decompress_l$LEVEL
#{ ls sort_$IN_FILE_SHORT_NAME* -la -ltr | grep \fasta$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt
#cd ..
#mv sort_mbgc_decompress_l$LEVEL/$IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt $IN_FILE_SHORT_NAME-sort_mbgc_d_size_l$LEVEL.txt
cd sort_fanalysis_mbgc_decompress_l$LEVEL
{ ls sort_fanalysis_$IN_FILE_SHORT_NAME* -la -ltr | grep \fa$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_mbgc_d_size_l$LEVEL-$sorting_type.txt
cd ..
mv sort_fanalysis_mbgc_decompress_l$LEVEL/$IN_FILE_SHORT_NAME-sort_fa_mbgc_d_size_l$LEVEL-$sorting_type.txt $IN_FILE_SHORT_NAME-sort_fa_mbgc_d_size_l$LEVEL-$sorting_type.txt

rm -r sort_fanalysis_mbgc_decompress_*

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

   # #MBGC
levels_array=("0" "1" "2" "3")
program=("" "fasta_analysis")
#program=("fasta_analysis")
#levels_array=("0")

# rm data_mbgc.csv
 rm *.mbgc
if [[ $sorted_compression -eq 1 ]]; then
 for ((i=0; i<${#levels_array[@]}; i++)); do
  MBGC_COMPRESSION_SORTED $INPUT_FILE ${levels_array[i]} $sorting_types;
 done
else
 for ((i=0; i<${#levels_array[@]}; i++)); do
   MBGC_COMPRESSION_UNSORTED $INPUT_FILE ${levels_array[i]} $sorting_types;
  done
fi
# m=$((m+1))
# done
#done
