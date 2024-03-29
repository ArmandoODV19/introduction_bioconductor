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
browseURL(report())


# checar duplicados
# para saber si tu dataset tiene duplicados se utilizan las funciones table() y
# srduplicated()
table(srduplicated(dfqsample))
# cuenta los duplicados como TRUE, y los unicos como FALSE


# una manera de eliminar los duplicados es filtrar aquellos que no estan duplicados
# o aquellos que son FALSE

cleanReads <- myReads[srduplicated(myReads) == FALSE]

# la funcion polynFilter() permite filtrar a partir de un nucleotido o paramtero
# especifico
# en el siguiente ejemplo nos quedaremos con las secuencias con almenos 10
# Adeninas "A"
polynFilter()
myFilterpolyA <- polynFilter(threshold = 10, nuc = c("A"))


# la paqueteria Rqc es una herramienta que genra un
# resumen de la informacion de control de calidad para secuenciacion
# masiva de alta calidad

BiocManager::install("Rqc")
library(Rqc)

# la funcion rqcQA() de la paqueteria Rqc permite hacer este analisis de calidad
rqcQA()
qaRqc <- rqcQA(files)
# el argumento workers permite definir el numero de nucleos que se utilizaran para
# hacer el analisis
qaRqc <- rqcQA(files, workers = 4)

# para hacer un reporte de calidad se utiliza la funcion
rqcReport()
# como argumentos se coloca el objeto y el nombre que se le dará al archivo

reportfile <- rqcReport(qaRqc, templateFile = "myReport.Rmd")
# despues se utiliza browseURL() para ver el reporte en el navegador
browseURL(reportfile)

