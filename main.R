# install.packages("jpeg")
rm(list = ls())
library(jpeg)
library(rsvd)

# load images
img1 <- readJPEG("images/1.jpg", native = TRUE)
img2 <- readJPEG("images/2.jpg", native = TRUE)
img3 <- readJPEG("images/3.jpg", native = TRUE)
img4 <- readJPEG("images/4.jpg", native = TRUE)
img5 <- readJPEG("images/5.jpg", native = TRUE)
img6 <- readJPEG("images/6.jpg", native = TRUE)
img7 <- readJPEG("images/7.jpg", native = TRUE)
img8 <- readJPEG("images/8.jpg", native = TRUE)
img9 <- readJPEG("images/9.jpg", native = TRUE)
img10 <- readJPEG("images/10.jpg", native = TRUE)
img11 <- readJPEG("images/11.jpg", native = TRUE)

# low rank svd
k = 10

s <- rsvd(img1, k=k)
img1 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img2, k=k)
img2 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img3, k=k)
img3 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img4, k=k)
img4 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img5, k=k)
img5 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img6, k=k)
img6 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img7, k=k)
img7 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img8, k=k)
img8 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img9, k=k)
img9 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img10, k=k)
img10 <- s$u %*% diag(s$d) %*% t(s$v)
s <- rsvd(img11, k=k)
img11 <- s$u %*% diag(s$d) %*% t(s$v)



# plot image
plt_img <- function(x){ image(x, col=grey(seq(0, 1, length=256)))}


# plot sequence backwards
#plt_img(img1[,nrow(img1):1])
#plt_img(img2[,nrow(img2):1])
#plt_img(img3[,nrow(img3):1])



final_avg = matrix((as.numeric(img1) + as.numeric(img2) + as.numeric(img3) + 
              as.numeric(img4) + as.numeric(img5) + as.numeric(img6) +
            as.numeric(img7) + as.numeric(img8) + as.numeric(img9) + 
              as.numeric(img10) + as.numeric(img11))/11, 600, 600)

plt_img(final_avg[,nrow(final_avg):1])