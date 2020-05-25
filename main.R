# install.packages("jpeg")
rm(list = ls())
library(jpeg)
library(rsvd)

# load images
num = 96 # number of images
avg_face <- readJPEG("average_face.jpg", native = TRUE)

faces <- list()
for (i in 1:num){
  faces[[i]]<-readJPEG(paste("face_images/",toString(i),".jpg",sep=""), native = TRUE)
}

# plot image (and rotate)
plt_img <- function(x){ image(x[,nrow(x):1], col=grey(seq(0, 1, length=256)))}

# flatten and create training matrix
X <- matrix(, nrow = 180*180, ncol = 0)
for (i in 1:num){
  X<-cbind(X, as.vector(faces[[i]]))
}


#covriance matrix
# C = X %*% t(X) <- intractable dimensions
L = t(X) %*% X 
e <- eigen(L)

# X %*% eigenvectors of X^TX = eigenvectors of XX^T

unit_vectorize <- function(x) {x / sqrt(sum(x^2))} # normalize to unit vector
U <- matrix(numeric(0), nrow = 180*180, ncol = 0)
for (i in 1:num){
  U <- cbind(U, X %*% unit_vectorize(e$vectors[,i]))
}
  
# eigenface components
S <- matrix(numeric(0),nrow=num, ncol=0)
for (i in 1:num){
  S <- cbind(S, t(U) %*% X[,i])
}

# low rank svd
#k = 10
#s <- rsvd(X, k=k)
# s$u %*% diag(s$d) %*% t(s$v)

