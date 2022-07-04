# los formatos para guardar secuencias son fastq y fasta
# los fastq incluyen formato de codificacion de calidad
# la terminacion de formatos fastq es fastq y fq
# la terminacion de formatos fasta es fa, fasta o seq

# para leer archivos fasta se utiliza la funcion readfasta() de la paqueteria ShortRead
# puede leer archivos compresos o libres

BiocManager::install("ShortRead")

library(ShortRead)

fasample <- readFasta(dir = "data/zika.fa", pattern = "fasta")
