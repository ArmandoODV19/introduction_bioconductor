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
