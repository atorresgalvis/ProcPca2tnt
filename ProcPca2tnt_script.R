## Ambrosio Torres (Laboratorio de Sistemática y Biogeografía, Universidad Industrial de Santander, Bucaramanga, Colombia) and
## Santiago A. Catalano (Consejo Nacional de investigaciones Cientificas y Técnicas; Unidad Ejecutora Lillo (UEL), Miguel Lillo, S.M. de Tucumán, Argentina).
## R version (>= 3.2.0) & Rstudio 0.98.1103
## 26th May 2015

###############################################################################################################################################################################
## 1. LOAD PACKAGES AND FUNCTIONS TO THE ANALYSIS
library(geomorph)        ## Load 'geomorph' package v. 2.1.4 ---  http://cran.r-project.org/web/packages/geomorph/index.html
source("implode.R")      ## Load "implode" function to join strings from a vector. Adapted from PHP (http://www.w3schools.com/php/func_string_implode.asp)
source("ProcPca2tnt.R")  ## Load "ProcPca2tnt" function to o compute a matrix of continuous characters in TNT format, from a PCA of shape (2D or 3D landmarks). (by Ambrosio Torres and Santiago A. Catalano)

###############################################################################################################################################################################
## 2. ANALYSIS
ProcPca2tnt("data.tps", cummvar = 0.90) ## Perform a PCA of shape using Procrustes-aligned specimens, and write a matrix of continuous characters in TNT format.
                                        ## The user can define the number of components to use (PC), taking into account the percentage of cummulative variance (by default = 90%). 

###############################################################################################################################################################################
## 3. REFERENCES
# *Goloboff PA, Mattoni CI, Quinteros AS (2006) Continuous characters analyzed as such. Cladistics, 22(6):589-601
# *Goloboff PA, Farris JS, Nixon KC (2008) TNT, a free program for phylogenetic analysis. Cladistics, 24(5):774-786 
