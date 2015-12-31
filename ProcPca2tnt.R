## Title: ProcPca2tnt
## Version: 0.1-1
## Date: 2015-05-26
## Author: Ambrosio Torres and Santiago A. Catalano 
## Maintainer: Ambrosio Torres <atorresgalvis@gmail.com>
## Depends: R version (>= 3.2.0), geomorph, 'implode' function
## Description: function to compute a matrix of continuous characters in TNT format, from a principal components analysis of shape (2D or 3D landmarks).
## License: GPL (3)

ProcPca2tnt <- function (x, cummvar = 0.90) {
    d1 <- readland.tps(x, specID = "ID")
    alg_d1<- gpagen(d1)
    pca_d1 <- plotTangentSpace(alg_d1$coords, label=NULL, verbose =T, warpgrids=F) 
    maxpca2use<- min(which(pca_d1$pc.summary$importance[3,] > cummvar))
    matrix2tnt <- pca_d1$pc.scores[,c(1:maxpca2use)]
    new_matrix2 <- NULL
    for (i in 1:dim(matrix2tnt)[2]) {
        new_matrix <- NULL
        if (min(matrix2tnt[,i]) < 0) {
            for (j in 1:length(matrix2tnt[,i])) {
            value_ch <- matrix2tnt[,i][j] - min(matrix2tnt[,i])
            new_matrix <- c(new_matrix, value_ch)  
            }
        }    
        if (min(matrix2tnt[,i]) > 0) {
            for (j in 1:length(matrix2tnt[,i])) {
            value_ch <- matrix2tnt[,i][j] + min(matrix2tnt[,i])
            new_matrix <- c(new_matrix, value_ch)  
            }
        } 
        new_matrix2 <- cbind(new_matrix2, new_matrix)
    }
    renew_matrix2 <- NULL
    for (i in 1:dim(new_matrix2)[2]) {
        renew_matrix <- NULL
        for (j in 1:length((new_matrix2)[,i])) {
            value_ch2 <- ((new_matrix2)[,i][j] / max(new_matrix2[,i])) *65
            renew_matrix <- c(renew_matrix, value_ch2)
        }
        renew_matrix2 <- cbind(renew_matrix2, renew_matrix)  
    }
    print(renew_matrix2)
    finalmatrix2tnt <- round(renew_matrix2, 3)
    fileConn <- file(paste(gsub(".tps","", x), ".tnt", sep=""))
    writeLines(c("","nstates cont", paste("xread", dim(finalmatrix2tnt)[2], dim(finalmatrix2tnt)[1], sep=" "),""), fileConn)
    close(fileConn)
    for (i in 1:dim(finalmatrix2tnt)[1]) {
        line <- dimnames(finalmatrix2tnt)[[1]][i]   
        value_line <- paste(line, implode(finalmatrix2tnt[i,], sep= " "))
        write(value_line,file= paste(gsub(".tps","", x), ".tnt", sep=""),append=TRUE)  
    }
    write(";",file= paste(gsub(".tps","", x), ".tnt", sep=""),append=TRUE)   
    write("proc/ ;",file= paste(gsub(".tps","", x), ".tnt", sep=""),append=TRUE)
}
