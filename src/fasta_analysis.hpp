//
// Created by fonsecatiago on 14-04-2023.
//

#ifndef FASTA_ANALYSIS_FASTA_ANALYSIS_H
#define FASTA_ANALYSIS_FASTA_ANALYSIS_H

#endif //FASTA_ANALYSIS_FASTA_ANALYSIS_H
#include <iostream>
#include <fstream>
//using std::fstream;
using namespace std;
#include <utility>
using std::cout;
using std::endl;
#include <vector>
#include <cstdlib>
#include <stdio.h>
#include <string.h>
using std::cerr;
#include <algorithm>
#include <cassert>
#include <random>
#include <chrono>

struct item{
    long int initial_position;
    long int initial_sequence_position;
    long int final_position;
    long int size;
    long int AT_nucleotides;
    long int CG_nucleotides;
    long int N_nucleotides;
};

enum Options {
    Help,
    Version,
    Verbose,
    Sort_size,
    Sort_nucleotide_AT,
    Sort_nucleotide_CG,
    Sort_nucleotide_AT_percentage,
    Sort_nucleotide_CG_percentage,
    Sort_alphabetically,
    Sort_combined_AT,
    Sort_combined_CG,
    Shuffle,
    Option_Invalid
    //others...
};

bool compareBySize(const item &a, const item &b);

bool compareByInitialPosition(const item &a, const item &b);

bool compareByANucleotide(const item &a, const item &b);

bool compareByCNucleotide(const item &a, const item &b);

bool compareByGNucleotide(const item &a, const item &b);

bool compareByTNucleotide(const item &a, const item &b);

bool compareByData(const item &a, const item &b);

std::vector<item> readFilePositions(std::string file_name);

void sequence_ordering(std::vector<item> items_vec,Options option,std::string infile_name,std::string outfile_name);

void shuffle_items(std::vector<item> items_vec,std::string input_filename,std::string nucleotide);