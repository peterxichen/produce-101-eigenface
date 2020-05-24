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

# low rank svd
k = 10

s <- rsvd(avg_face, k=k)
avg_svd <- s$u %*% diag(s$d) %*% t(s$v)

faces_svd <- list()
for (i in 1:11){
  s <- rsvd(faces[[i]], k=k)
  faces_svd[[i]] <- s$u %*% diag(s$d) %*% t(s$v)
}


plt_img(final_avg[,nrow(final_avg):1])