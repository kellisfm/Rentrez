#Assignment 2 script. 
#Kai Ellis, 20019803
#library for this script:
library(rentrez)

#This script will: 
#1 contain the following lines:
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

#2 explain what each does in comments
#3 use strsplit() to output a vector of the three sequences of the Bburg object
#4print the vector into a csv called Sequences


#The first line: ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") is simply an object
#that contains a vector with 3 strings. Each of these strings is one NCBI id from the page that
#we are scraping data from. This line is important for use in the next one.

#the second line: Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") is where
#the rentrez package is actually used. entrez_fetch is a command that uses unique identifiers to recieve
#data files from the NCBI database

#the first part of this command "db=nuccore", just states which data base to use
#id=ncbi_ids, assigns the vector of ids we made earlier to the data, giving the sequences their names
#Finally, rettype = "fasta" tells R which format the data is in. In this case Fasta

#add in a marker infront of each ncbi id that we can use for string splitting
#additionally, swapping the unkown nucleotides (\n) to N will enable easier counting of nucleotides down the road
Bburg=gsub("\n","N",Bburg)
Bburg=gsub(" sequence"," sequence: ",Bburg)
Bburg=gsub(">","-Target- >",Bburg)

#remove the first target to prevent the creation of an empty string through strsplit.
Bburg=sub("-Target- ","",Bburg)

#next we can use the string split function to split the string into 3 parts based on our target.  

BurgVec=strsplit(Bburg,"-Target- ")
#unlist seems to remove the title from the csv, which is nice.
BurgVec=unlist(BurgVec)

#now we can upload this to a .csv and move on to the R markdown section!
write.csv(BurgVec,"Sequences.csv")

