# Instalación

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(version = "3.15")


# instalando y cargando paqueterias

BiocManager::install("BSgenome")
library(BSgenome) #las paqueterias se cargan igual

# definir si un objeto es s4
isS4()
# o con str(), si es s4 empezará la descripción con el argumento Formal class


# para crear una clase se utiliza la funcion setClass

MyEpicProject <- setClass(#define class with upper camel case
  "MyEpicProject",
  # define slots
  slots = c(ini = "Date",
            end = "Date",
            milestone = "character"),
  # define inheritance
  contains = "MyProject")

# la funcion .S4methods(class = "project") genera un resumen de los accesorios

.S4methods()

# para obtener un resumen por objeto se utiliza la funcion show()
show(MyDescriptor)

# ver clases de un objeto
showClass("BSgenome")

# se puede obtener información del data set como organismo, proveedor e información
# de secuencia a partir de las siguientes funciones
# dentro del parentesis va el nombre del objeto s4 con la secuencia

organism()
provider()
seqinfo()


# descargando y cargando libreria de S cerevisiae
BiocManager::install("BSgenome.Scerevisiae.UCSC.sacCer3")
library(BSgenome.Scerevisiae.UCSC.sacCer3)

# nombrando al objeto yeast con la secuencia de S cerevisiae
yeast <- BSgenome.Scerevisiae.UCSC.sacCer3
# explorando informacion de secuencia
isS4(yeast)
.S4methods(class = "yeast")
show(yeast)
organism(yeast)
provider(yeast)
seqinfo(yeast)

# para conocer otros genomas disponibles se utiliza la funcion available.genomes()
available.genomes()

# para conocer el numero de cromosomas se utiliza la funcion lenght
length(yeast)
# nombres de los cromosomas
names(yeast)
# largo de los cromosomas en pares de bases
seqlengths(yeast)

# longitud de cromosomas individuales
nchar(yeast$chrI)

# se puede obtner secuencias especificas del genoma con la funcion getSeq
# en este ejemplo se obtiene todo el genoma
getSeq(yeast)

# se puede especificar el cromosoma colocando el nombre del mismi
getSeq(yeast, "chrM")
getSeq(yeast, "chrIII")

# para seleccionar locaciones especificas para extraer se
# utilizan los argumentos start, end, width
getSeq(yeast, start = 5)
