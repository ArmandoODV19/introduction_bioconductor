# los formatos para guardar secuencias son fastq y fasta
# los fastq incluyen formato de codificacion de calidad
# la terminacion de formatos fastq es fastq y fq
# la terminacion de formatos fasta es fa, fasta o seq

# para leer archivos fasta se utiliza la funcion readfasta() de la paqueteria ShortRead
# puede leer archivos compresos o libres

BiocManager::install("ShortRead")

library(ShortRead)

fasample <- readFasta(dir = "data/zikaVirus_seq.fasta", pattern = "fasta")

# para escribir un objeto en formato fasta se utiliza la funcion writeFasta()

writeFasta(zika, file = "data/zikaVirus_seq.fasta")

# para leer archivos fastq se utiliza la funcion readfastq()
readFastq() # se utiliza iguañ que readFasta()

# para escribir un archivo fastq se utiliza la funcion writeFastq()
writeFastq(fastq, file="data/sample.fastq.gz") # se debe guardar en terminacion .gz


