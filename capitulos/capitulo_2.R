# la paqueteria Biostrings permite manipular secuencias biologicas

BiocManager::install("Biostrings")
library(Biostrings)

DNA_BASES
RNA_BASES
AA_STANDARD #aa en una letra

DNA_ALPHABET
RNA_ALPHABET
AA_ALPHABET

# la funcion alphabetFrequency() genera un conteo de las bases en la secuencia
alphabetFrequency(dna_seq)
# alphabet() solo muestra los carcteres presentes en la secuencia
alphabet(dna_seq)
alphabet(dna_seq, baseOnly = TRUE) # muestra solo las bases

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

# la funcion translate() tambien acepta secuencias de ADN
translate(dna_seq)

# NOTA: para multiples secuencias se utiliza lo siguiente
DNAStringSet()
RNAStringSet()
AAStringSet()

# para leer un archivo de secuencia terminacion .fa se utiliza la funcion
# readDNAStringSet()

readDNAStringSet()

zika <- readDNAStringSet("data/zika.fa.txt")
length(zika)
width(zika)

# para convertir un strinset a un solo string se utiliza unlist()

zikaVirus_seq <- unlist(zika)
length(zikaVirus_seq)

# para hacer un conjunto de secuencias a partir de una sola se utiliza la
# funcion DNAStringSet() pero se especifican los puntos de corte

zikaSet <- DNAStringSet(zikaVirus_seq, start = c(1, 101, 201), end = c(100, 200, 300))
zikaSet

# con la funcion complement() se obtiene la cadena complementaria
zikaVirus_seq
complement(zikaVirus_seq)

# rev() cambia el orden de las secuencias en un set
# reverse() cambia el orden de izquierda a derecha de una secuencia

zikaSet
rev(zikaSet)

zikaVirus_seq
reverse(zikaVirus_seq)
