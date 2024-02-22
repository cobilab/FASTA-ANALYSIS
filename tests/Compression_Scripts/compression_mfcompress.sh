
#!/bin/bash
function MFCOMPRESS_COMPRESSION_UNSORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  sorting_type="$4";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME


{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -$LEVEL -p $PARTITION -t 8 $IN_FILE ; } 2>$IN_FILE_SHORT_NAME-mfc_l$LEVEL-p$PARTITION-t8.txt 

{ ls $IN_FILE* -la -ltr | grep \.mfc$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-mfc_size_l$LEVEL-p$PARTITION-t8.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -$LEVEL -p $PARTITION -t 8 $IN_FILE.mfc ; } 2> $IN_FILE_SHORT_NAME-mfc_d_l$LEVEL-p$PARTITION-t8.txt 

{ ls $IN_FILE* -la -ltr | grep \.mfc.d$ |awk '{print $5;}' ; } > $IN_FILE_SHORT_NAME-mfc_d_size_l$LEVEL-p$PARTITION-t8.txt

rm *mfc.d
  
}


function MFCOMPRESS_COMPRESSION_SORTED(){
  IN_FILE="$1";
  LEVEL="$2";
  PARTITION="$3";
  sorting_type="$4";

  IN_FILE_SHORT_NAME=$(ls -1 $IN_FILE | sed 's/.fa//g')
  echo $IN_FILE_SHORT_NAME


{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressC -v -$LEVEL -p $PARTITION -t 8 sort_fanalysis_$sorting_type-$IN_FILE ; } 2>$IN_FILE_SHORT_NAME-sort_fa_mfc_l$LEVEL-p$PARTITION-t8-$sorting_type.txt 

{ ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.mfc$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_mfc_size_l$LEVEL-p$PARTITION-t8-$sorting_type.txt

{ /bin/time -f "TIME\t%e\tMEM\t%M" ./MFCompressD -v -$LEVEL -p $PARTITION -t 8 sort_fanalysis_$sorting_type-$IN_FILE.mfc ; } 2>$IN_FILE_SHORT_NAME-sort_fa_mfc_d_l$LEVEL-p$PARTITION-t8-$sorting_type.txt

{ ls sort_fanalysis_$sorting_type-$IN_FILE* -la -ltr | grep \.mfc.d$ |awk '{print $5;}'; } > $IN_FILE_SHORT_NAME-sort_fa_mfc_d_size_l$LEVEL-p$PARTITION-t8-$sorting_type.txt

rm *mfc.d
  
}

#FILE=$1
# sorting_types=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"
# INPUT_FILE=( "${@:2:$1}" ); shift "$(( $1 + 1 ))"

# declare -p sorting_types INPUT_FILE
sorting_type=$1
INPUT_FILE=$2
# n=$3
test=$3
sorted_compression=$4
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
rm *.mfc
#levels_array=("0")
#partitions_array=("1")
#Levels for
if [[ $sorted_compression -eq 1 ]]; then
for ((i=0; i<${#levels_array[@]}; i++)); do
#Partitions
  for ((j=0; j<${#partitions_array[@]}; j++)); do
    MFCOMPRESS_COMPRESSION_SORTED $INPUT_FILE ${levels_array[i]} ${partitions_array[j]} $sorting_type ;
  done
 done 
else
for ((i=0; i<${#levels_array[@]}; i++)); do
#Partitions
  for ((j=0; j<${#partitions_array[@]}; j++)); do
    MFCOMPRESS_COMPRESSION_UNSORTED $INPUT_FILE ${levels_array[i]} ${partitions_array[j]} $sorting_type ;
  done
 done 
fi


 #m=$((m+1))
 #done
#done