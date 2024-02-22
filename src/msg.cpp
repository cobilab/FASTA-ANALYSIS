#include "msg.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;

#define VERSION 1
#define RELEASE 1

void PrintMenuCompression(void){
    //printf(std::cerr,
    std::cout<<"                                                                        \n";
    std::cout <<"      FA: Analysis of a Fasta File                                                                      \n";
    std::cout << "      ===========================================================       \n";
    std::cout << "                                                                        \n";
    std::cout << "AUTHORS                                                                 \n";
    std::cout << "      Tiago Fonseca (tiagorfonseca@ua.pt)                               \n";
    std::cout << "                                                                        \n";
    std::cout << "SYNOPSIS                                                                \n";
    std::cout << "      ./FASTA_ANALY [INPUT_FILE] [OUTPUT_FILE] seed                                                            \n";
    std::cout << "                                                                        \n";
    std::cout <<  "SAMPLE                                                                  \n";
    std::cout <<  "      ./FASTA_ANALY -sort=AT genome.fa ordered_genome.fa 5                    \n";
    std::cout <<  "                                                                        \n";
    std::cout <<  "DESCRIPTION                                                             \n";
    std::cout <<  "     Analysis and Ordering of Fasta files according to diferent parameters \n";
    //VERSION, RELEASE);

    //  printf(std::cerr,

    std::cout << "                                                                      \n";
    std::cout <<  "COPYRIGHT                                                               \n";
    std::cout << "      Copyright (C) 2022,  University of Aveiro.                       \n";
    std::cout <<"      This is a Free software, under GPLv3. You may redistribute        \n";
    std::cout << "      copies of it under the terms of the GNU - General Public          \n";
    std::cout<< "      License v3 <http://www.gnu.org/licenses/gpl.html>. There          \n";
    std::cout<<"      is NOT ANY WARRANTY, to the extent permitted by law.              \n";
    std::cout<<"                                                                        \n";
}

void PrintHelpMenu(int flag){
    if(flag=1){
        std::cout<< "                                              \n";
        std::cout<<"                 MANDATORY ARGUMENTS                                                                      \n";
        std::cout <<"      [INPUT_FILE]                                                            \n";
        std::cout << "           Input sequence filename (to analyze) -- MANDATORY.           \n";
        std::cout << "           File to analyze                              \n";

        //printf(stderr,
        std::cout <<"                                                                        \n";
        std::cout <<"      [OUTPUT_FILE]                                                         \n";
        std::cout << "           Output sequence filename (to analyze) -- MANDATORY.           \n";
        std::cout <<"           File to store the ordered sequences                                                                                 \n";

        std::cout <<"                                                                        \n";
        std::cout <<"      seed                                                             \n";
        std::cout << "           seed value -- MANDATORY.           \n";
        std::cout <<"           A long int value used in shuffle method,defining a random new order to the input file sequences                                                                 \n";

        std::cout<< "                                                               \n";
        std::cout<<"             EXECUTION OPTIONS                                                         \n";

        std::cout<<"                                                                     \n";
        std::cout <<"      -s                                                           \n";
        std::cout << "           create new file with shuffled sequences           \n";

        std::cout<<"                                                                     \n";
        std::cout <<"      -sort=CRIT                                                            \n";
        std::cout << "           sort by given CRIT(Criteria) : size (-S), Nucleotides Pair (-AT or -CG), alphabetically (-A) or combinations of criteria such as Size+Nucleotides Pair (-CAT or - CCG)             \n";


        std::cout<<"                                                                     \n";
        std::cout <<"      -V                                                            \n";
        std::cout << "           output version information             \n";


        std::cout<<"                                                                     \n";
        std::cout <<"      -v                                                            \n";
        std::cout << " 	 verbose mode                      \n";

        std::cout<<"                                                                     \n";
        std::cout <<"      -h                                                            \n";
        std::cout << " 	 help menu                      \n";
    }
}

void PrintNoArgumentsError(){
    std::cout<<"     ./FASTA_ANALY                                                                \n";
    std::cout <<"./FASTA_ANALY : missing file operand                                                                  \n";
    std::cout << "Try './FASTA_ANALY -h' for more information 	                       \n";
}

void PrintVersion(void){
    //printf(std::cerr,
    std::cout << "                                                                        \n";
    std::cout <<"                          =================                             \n";
    std::cout <<"                          |    FA %u.%u   |                           \n";
    std::cout <<"                          =================                             \n";
    std::cout << "                                                                        \n";
    std::cout << "             Analysis and ordering of a Fasta File                      \n";
    std::cout << "                                                                        \n";
    std::cout << "               Copyright (C) 2022 University of Aveiro.                 \n";
    std::cout << "                                                                        \n";
    std::cout << "                                                                        \n";
    std::cout << "You may redistribute copies of it under the terms of the GNU - General  \n";
    std::cout << "Public License v3 <http://www.gnu.org/licenses/gpl.html>. There is NOT  \n";
    std::cout << "ANY WARRANTY, to the extent permitted by law. Developed and Written by  \n";
    std::cout << "Tiago Fonseca.\n\n" << VERSION <<"."<< RELEASE << endl;
}
//
// Created by fonsecatiago on 14-04-2023.
//
