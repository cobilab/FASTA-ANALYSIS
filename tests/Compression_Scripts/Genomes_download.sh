#Download Genomes

#!/bin/bash

genomesPath="." # "../genomes"

urls=(
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102205/TaeRenan_refseq_v2.1.fa" # 13.50GB

    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102253/Coding_Sequences_AldGig_1.0.fa" # 4.45GB
    "https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0.fa" # human reference genome # ~3GB
    "https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.fna.gz" # human reference genome # ~3GB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102252/SI_Tiger_assembly.fasta" # 2.39GB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102252/Bengal_Tiger_Machali.fasta" # 2.27GB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102199/GCA_004024665.1_LemCat_v1_BIUU_genomic.fna" # 2.22GB

    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102199/hg38.fa.gz" # 938.09MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102199/gorGor6.fa.gz" # 903.79MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102199/calJac4.fa.gz" # 887.99MB	
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102191/Pseudobrama_simoni.genome.fa" # 886.11MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102192/Rhodeus_ocellatus.genome.fa" # 860.71MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102188/Naso_vlamingii.genome.fa" # 821.29MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102193/00_Assembly_Fasta/haplotigs/TME204.HiFi_HiC.haplotig1.fa" # CASSAVA, 727.09MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102199/Mmur_3.0.fa.gz" # 720.14MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102193/00_Assembly_Fasta/haplotigs/TME204.HiFi_HiC.haplotig2.fa" # 673.62MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102187/Chaetodon_trifasciatus.genome.fa" # 636.91MB
    "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102189/Chelmon_rostratus.genome.fa" # 609.48MB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102190/Helostoma_temminckii.genome.fa" # 605.25MB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102171/Eudyptes_moseleyi.genomic.fa.gz" # 353.42MB

    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102198/ensete_glaucum.evm.cds.fna" # 40.21MB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102173/Spheniscus_magellanicus.cds.v1.fa" # 23.49MB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102171/Eudyptes_moseleyi.cds.v1.fa" # 23.34MB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102172/Megadyptes_antipodes_antipodes.cds.v1.fa" # 22.28MB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102174/Spheniscus_demersus.cds.v1.fa" # 21.87MB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102200/phyml_tree.fa" # 2.36MB

    # "https://raw.githubusercontent.com/rongjiewang/DMcompress/master/test.fasta" # 710.0KB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102012/RL0949_chloroplast.fa" # 157.91KB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/101001_102000/101111/RL0048_chloroplast.fa" # 154.2KB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102011/RL0948_chloroplast.fa" # 153.45KB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102130/RL1067_chloroplast.fa" # 150.17KB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/101001_102000/101120/RL0057_chloroplast.fa" # 135.7KB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102150/RL1087_chloroplast.fa" # 134.88KB
    # "https://raw.githubusercontent.com/plotly/datasets/master/Dash_Bio/Genetic/COVID_sequence.fasta" # 29.7KB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102253/Aldabrachelys_gigantea_mitochondrial_genome.fasta" # 16.55KB
    # "https://ftp.cngb.org/pub/gigadb/pub/10.5524/102001_103000/102194/mt_genome_CM029732.fa" # 15.06KB
)

declare -p urls


#
# === Download rawFiles ===========================================================================

printf "downloading...\n"
for url in "${urls[@]}"; do
    # gets filename by spliting in "/" and getting the last element
    rawFile=$(echo $url | rev | cut -d'/' -f1 | rev | sed 's/\.fa\|\.fna\|\.fasta/_raw.fa/')
    genFile="${rawFile//_raw/}"

    if [[ ! -f "$genomesPath/$genFile" ]]; then 
        wget -c $url -O "$genomesPath/$rawFile"

        # se outros ficheiros do mesmo genoma já existirem apesar de .fa ter sido criado depois, remove-los para atualizar .seq
        find "$genomesPath/" -name "$rawFile.*" ! -name "*.fa" -type f -delete
    else 
        # no need to download a file that already exists
        echo "$rawFile has been previously downloaded"
    fi
done



gzFiles=( $(ls "$genomesPath" | egrep ".gz$") )
rawFiles=( $(ls $genomesPath | egrep "_raw.fa") )
if [ ${#rawFiles[@]} -eq 0 ]; then 
    echo "all files have been previously downloaded, so the program will end here"; 
    exit; 
fi
#
# === Unzip .gz files ===========================================================================
#
printf "\nunzipping .gz files...\n"
for gzFile in "${gzFiles[@]}"; do
    unzippedFile="${gzFile%.gz}"

    if [[ -f "$genomesPath/$unzippedFile" ]]; then 
        echo "$gzFile has been previously unzipped" 

    else 
        gunzip "$gzFile"
        rm -fr "$gzFile"
        echo "$gzFile --unzipped-as--> $unzippedFile"
    fi
done

#
# === copy files to genomes Repository ==========================================================
#