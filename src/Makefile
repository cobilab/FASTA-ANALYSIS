CC = g++
CFLAGS = -g -Wall -pg
TARGET= FASTA_ANALY


fasta_analysis: fasta_analysis.o msg.o
	$(CC) -o $(TARGET) fasta_analysis.o msg.o
fasta_analysis.o: fasta_analysis.cpp fasta_analysis.hpp msg.hpp
	$(CC) -c fasta_analysis.cpp fasta_analysis.hpp
	$(CC) -c msg.cpp msg.hpp
