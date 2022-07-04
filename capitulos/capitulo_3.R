# cargar IRanges package

library(IRanges)
# permitela estructura fundamental y operaciones paramanipular intervalos de secuencias
# para crear un IRange se utiliza la funcion IRanges() y los argumentos start y end
IRanges()
myIRanges <- IRanges(start = 20, end = 30)
myIRanges

# tambien se puede usar el argumento width, o hacer mas de un IRanges a la vez

myIRangeswidth <- IRanges(start = c(1,20), width = c(30, 11))
myIRangeswidth

# tambien se puede dejar un solo punto final
myIRanges_end <- IRanges(start = c(1, 20, end = 30))
myIRanges_end

# se puede hacer un IRanges y especificar en qué numero empezar a partir de booleanos
# en este ejemplo se eliminan  los primeros dos elemntos
IRanges(c(FALSE, FALSE, TRUE, TRUE))

# cargar genomic Rangers
library(GenomicRanges)

# la funcion GRanges() guarda intervalos genómicos por cromosoma
# los argumentos minimos son el cromosoma, inicio y fin del intervalo
# y se definen en formato caracter
GRanges()
GRanges("chr1:200-300")


# la funcion as() permite transformar un data frame en un objeto GRangers

seqnames <- c("chrX", "chrX", "chrX", "chrY", "chrY")
start <- c(50,130,153,30,50)
end <- c(120,140,154,40,55)
strand <- c("+", "+", "+", "*", "-")
GC <- c(0.25, 0.25, 0.25, 0.25, 0.25)

mydf <- data.frame(seqnames, start, end, strand, GC)

myGR <- as(mydf, "GRanges")
myGR

# explotando GRanges
seqnames(myGR) # secuencia
ranges(myGR) #IRanges de la secuencia
mcols(myGR)
seqinfo(myGR) # informacion de la secuencia
genome(myGR) # nombre del genoma

# cargando genoma de referencia humano hg38
BiocManager::install("TxDb.Hsapiens.UCSC.hg38.knownGene")
# cargando la libreria
library(TxDb.Hsapiens.UCSC.hg38.knownGene)

hg <- TxDb.Hsapiens.UCSC.hg38.knownGene

# para seleccionar cromosomas de interes se utiliza la funcion genes()
genes()
# seleccionando cromosoma X
# para extraer un cromosoma se usa el argumento filter y list()
# tx_chrom extae el id del gen, pero exxisten otros argumentos
# "gene_id", "tx_id", "tx_name", "tx_chrom", "tx_strand",
# "exon_id", "exon_name", "exon_chrom", "exon_strand",
# "cds_id", "cds_name", "cds_chrom", "cds_strand", and "exon_rank"
hg_chrXg <- genes(hg, filter = list(tx_chrom = c("chrX")))
hg_chrXg

seqinfo(hg)
genome(hg)

# es posible usar mas de un argumento a la vez

hg_chrXgp <- genes(hg, filter = list(tx_chrom = c("chrX"), tx_strand = "+"))
sort(hg_chrXgp)
# en este ejmplo se extraen los genes del cromosoma x en la cadena positiva
