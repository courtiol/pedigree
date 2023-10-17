\name{makeAinv}
\alias{makeAinv}
\title{Makes inverted A matrix for a pedigree}
\description{
  Makes inverted A matrix for a pedigree and stores it in a file called
  \code{Ainv.txt}.}
  \usage{
makeAinv(ped,file)
}
\details{
 The function does not output anything but writes the results into a file stored 
 in the current working environment. This file is called 'Ainv.txt' by default, 
 but you can change the file name using the \code{file} argument. This becomes 
 mandatory when running different calls in parallel, otherwise the different 
 instances would all write into the same file.
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ped}{\code{data.frame} with three columns: id,id parent1,id parent2 }
  \item{file}{Character string indicating the name of the file storing the computed information. See details.}
}
\value{
  Logical.
}
\examples{
id <- 1:6
dam <- c(0,0,1,1,4,4)
sire <- c(0,0,2,2,3,5)
ped <- data.frame(id,dam,sire)
makeAinv(ped)
Ai <- read.table('Ainv.txt')
nInd <- nrow(ped)
Ainv <- matrix(0,nrow = nInd,ncol = nInd)
Ainv[as.matrix(Ai[,1:2])] <- Ai[,3]
dd <- diag(Ainv)
Ainv <- Ainv + t(Ainv)
diag(Ainv) <- dd

if(file.exists("Ainv.txt"))
file.remove("Ainv.txt")

## Adjusting file name explicitly

makeAinv(ped,file = 'Ainv2.txt')
Ai2 <- read.table('Ainv2.txt')
if(file.exists('Ainv2.txt'))
file.remove('Ainv2.txt')


}
\keyword{utilities}

