# Instalación

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(version = "3.15")


# instalando y cargando paqueterias

BiocManager::install("BSgenome")
library(BSgenome) #las paqueterias se cargan igual
