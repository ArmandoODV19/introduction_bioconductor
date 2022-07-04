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
