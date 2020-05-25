# install.packages("jpeg")
rm(list = ls())
library(jpeg)
library(rsvd)

# load images
avg_face <- readJPEG("average_face.jpg", native = TRUE)

faces <- list()

for (i in 1:11){
  faces[[i]]<-readJPEG(paste("face_images/",toString(i),".jpg",sep=""), native = TRUE)
}

# plot image (and rotate)
plt_img <- function(x){ image(x[,nrow(x):1], col=grey(seq(0, 1, length=256)))}

# flatten and create training matrix
X <- matrix(, nrow = 360000, ncol = 0)
for (i in 1:11){
  X<-cbind(X, as.vector(faces[[i]]))
}



# low rank svd
k = 10

s <- rsvd(X, k=k)
# s$u %*% diag(s$d) %*% t(s$v)