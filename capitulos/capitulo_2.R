# la paqueteria Biostrings permite manipular secuencias biologicas

BiocManager::install("Biostrings")
library(Biostrings)

DNA_BASES
RNA_BASES
AA_STANDARD #aa en una letra

DNA_ALPHABET
RNA_ALPHABET
AA_ALPHABET

# la funcion DNAString() permite generar un objeto con una secuencia de adn

dna_seq <- DNAString("ATGATCTCGTAA")
dna_seq
isS4(dna_seq)

# la funcion RNAString cambia la informacion de una secuencia de adn a arn

rna_seq <- RNAString(dna_seq)
rna_seq

# la funcion translate() permite traducir la secuencia de ARN a aa

aa_seq <- translate(rna_seq)
aa_seq
