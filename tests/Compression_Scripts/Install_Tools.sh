#!/bin/bash
#
# Manual Installation
#
function Manual_Installation(){
# NAF ----------------------------------------------------------------------
#
git clone --recurse-submodules https://github.com/KirillKryukov/naf.git
cd naf && make && make test && sudo make install
cp ennaf/ennaf ../
cp unnaf/unnaf ../
cd ../
rm -fr naf
#
# MFCompressC ----------------------------------------------------------------------
#
rm -fr MFCompress-linux64-1.01.tgz MFCompress-linux64-1.01/
wget http://sweet.ua.pt/ap/software/mfcompress/MFCompress-linux64-1.01.tgz
tar -xvzf MFCompress-linux64-1.01.tgz
cp MFCompress-linux64-1.01/MFCompressC .
cp MFCompress-linux64-1.01/MFCompressD .
rm -fr MFCompress-linux64-1.01/ MFCompress-linux64-1.01.tgz
#
# JARVIS3 ----------------------------------------------------------------------
#
#rm -rf JARVIS2-bin-64-Linux.zip extra JARVIS2.sh JARVIS2-bin-64-Linux/
#wget https://github.com/cobioders/HumanGenome/raw/main/bin/JARVIS2-bin-64-Linux.zip
wget https://github.com/cobilab/jarvis3/archive/refs/heads/main.zip
unzip -o main.zip
cd jarvis3-main/src/
./JARVIS3.sh --install
cd ..
cd ..
cp jarvis3-main/src/JARVIS3.sh .
cp jarvis3-main/src/JARVIS3 .
cp jarvis3-main/src/MergeFastaStreamsJ3 .
cp jarvis3-main/src/MergeFastqStreamsJ3 .
cp jarvis3-main/src/SplitFastaStreamsJ3 .
cp jarvis3-main/src/SplitFastqStreamsJ3 .
cp jarvis3-main/src/bbb .
cp jarvis3-main/src/bzip2 .
#
#
# LZMA ----------------------------------------------------------------------
#
sudo apt-get update -y
sudo apt-get install -y lzma
#
# MBGC ----------------------------------------------------------------------
#
git clone https://github.com/kowallus/mbgc.git
cd mbgc
mkdir -p build
cd build
cmake ..
make mbgc
cd ../../
mv mbgc mbgc_dir # rename mbgc directory to move mbgc executable to scripts
cp mbgc_dir/build/mbgc .
rm -fr mbgc_dir
#
#ALCOR-----------------------------------------------------------------------
#
sudo apt-get install cmake git
git clone https://github.com/cobilab/alcor.git
cd alcor/src/
cmake .
make
cd ..
cd ..
cp alcor/src/AlcoR .


#FASTA_ANALY----------------------------------------------------------------------
#
git clone https://github.com/tiagof1993/Eficient_DNA_Compressor
cp Eficient_DNA_Compressor/bin/FASTA_ANALY .


}

# cp JARVIS2-bin-64-Linux/extra/* .
# cp JARVIS2-bin-64-Linux/JARVIS2.sh .
# cp JARVIS2-bin-64-Linux/JARVIS2 .
#
# ------------------------------------------------------------------------------
# Bioconda Install
# ------------------------------------------------------------------------------
# NAF ----------------------------------------------------------------------
#
function Install_with_Conda(){
    #
    # NAF ------------------------------------------------------------------------
    #
    conda install -y -c bioconda naf
    #
    # MBGC ------------------------------------------------------------------------
    #
    conda install -y -c bioconda mbgc 
    #
    # GTO ------------------------------------------------------------------------
    #
    conda install -y -c cobilab gto
    #ALCOR ------------------------------------------------------------------------
    #
    conda install -y -c bioconda alcor
}

Install=$1

if [ $Install -eq 0 ];then
    Install_with_Conda
else
    Manual_Installation
fi