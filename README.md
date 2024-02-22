# FASTA_ANALYSIS

The objective of this work is to find a strategy who improves compression of genomic sequences (fasta,fa,etc). For that we already have a plentitude of compressing tools available in the market, such as NAF,MBGC,GZIP, among others.

But, if we can work on a previous ordered file, where the most similar sequences are grouped, it's reasonable to think that the compression ratio would decrease. So, to achieve that, an executable file will be created (generated with C++ code) dedicated to sort that type of file. The criteria used to do that can be decided by the user when he is running ./FASTA_ANALY. It can go from absolute number or percentage of nucleotide pairs (AT or CG) to size or percentage.

On the other hand, there's also a compression script where it's possible to use the 5 sorting compression scenarios together with 7 different compressors, 3 are general-purpose and 4 are DNA-specific. This script will give not only the sizes of the compressed files and the times of the compression but also a comparison between compression with or without sorting, through the creation of CSV viles and plots.

## Usage Example
` ./FASTA_ANALY -sort=AT unsorted_file.fasta sorted_file.fasta 1 `

A description of the options available can be obtained, invoking:

` ./FASTA_ANALY -h `



### Data compression tools used ###

<br>
<div align="center">

| Data Compressor | Repository | Description  |
|-----------------|------------|--------------|
| NAF             |<a href="https://github.com/KirillKryukov/naf">code</a>  | <a href="https://doi.org/10.1093/bioinformatics/btz144">article</a>|
| MFCompress      |<a href="http://sweet.ua.pt/ap/software/mfcompress/MFCompress-linux64-1.01.tgz">code</a>  | <a href="https://doi.org/10.1093/bioinformatics/btt594">article</a>|
| JARVIS3         |<a href="https://github.com/cobilab/jarvis3">code</a>  | |
| gzip           |<a href="https://ftp.eq.uc.pt/software/unix/gnu/gzip/">code</a>  | <a href="https://www.gnu.org/software/gzip/manual/gzip.pdf">article</a>|
| lzma            |<a href="https://tukaani.org/xz/">code</a>  | |
| bzip2           |<a href="https://sourceware.org/bzip2/">code</a>  | <a href="https://pi.kwarc.info/historic/systems/texlive/2000/texmf/doc/bzip2/manual.pdf">article</a>|
| MBGC         |<a href="https://github.com/kowallus/mbgc">code</a>  | <a href="https://doi.org/10.1093/gigascience/giab099">article</a> |

</div>
<br>

### Compression Benchmark Reproducibility: ###

Change directory and give execute permissions:
<pre>
cd src/Compression_Scripts
chmod +x *.sh
</pre>



### Compression Benchmark Usage: ###

Run all compression commands:
<pre>
./compression_test_script.sh
</pre>

Run isolated compression commands:
<pre>
./compression_COMPRESSORNAME.sh SORTING_TYPE INPUT_FILE 0
</pre>

