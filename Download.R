#Assignment 2 script. 
#Kai Ellis, 20019803
#This script will: 
#1 contain the following lines:
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

#2 explain what each does in comments
#3 use strsplit() to output a vector of the three sequences of the Bburg obj
#4print the vector into a csv called Sequences