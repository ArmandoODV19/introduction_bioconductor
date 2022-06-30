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

