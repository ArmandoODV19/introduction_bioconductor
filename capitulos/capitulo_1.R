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
