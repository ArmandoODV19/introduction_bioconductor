# los formatos para guardar secuencias son fastq y fasta
# los fastq incluyen formato de codificacion de calidad
# la terminacion de formatos fastq es fastq y fq
# la terminacion de formatos fasta es fa, fasta o seq

# para leer archivos fasta se utiliza la funcion readfasta() de la paqueteria ShortRead
# puede leer archivos compresos o libres

BiocManager::install("ShortRead")

library(ShortRead)

fasample <- readFasta(dir = "data", pattern = "zikaVirus_seq.fasta")

# para escribir un objeto en formato fasta se utiliza la funcion writeFasta()

writeFasta(zika, file = "data/zikaVirus_seq.fasta")

# para leer archivos fastq se utiliza la funcion readfastq()
readFastq() # se utiliza iguañ que readFasta()

# para escribir un archivo fastq se utiliza la funcion writeFastq()
writeFastq(fastq, file="data/sample.fastq.gz") # se debe guardar en terminacion .gz



# la funcion quality() se utiliza para conocer la calidad de la secuencia
quality()
encoding(quality())
# antes de cada analisis se debe evaluar la calidad

# la funcion PhredQuality() genera el puntaje de calidad de forma numerica
# para que sea mas facil de visualizar
# se utiliza en conjunto a quality() y dentro de quality() se coloca el objeto fastq
PhredQuality()
PhredQuality(quality(fqsample))

# se puede hacer una lista
pq <- PhredQuality(quality(fqsample))
qs <- as(pq, "IntegerList")

# qa() genera un resumen de la descripcion de calidad del objeto fastq
qa()

# browseURL(report()) se utiliza para obtener graficos y tablas de calidad en el servidor
# dentro de report() se coloca el resultado de qa()
browseURL()
