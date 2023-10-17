\name{makeA}
\alias{makeA}
\title{Makes the A matrix for a part of a pedigree}
\description{
  Makes the A matrix for a part of a pedigree and stores it in a file called
  \code{A.txt}.}
  \usage{
makeA(ped,which,file)
}
\details{
 The function does not output anything but writes the results into a file stored 
 in the current working environment. This file is called 'A.txt' by default, but 
 you can change the file name using the \code{file} argument. This becomes 
 mandatory when running different calls in parallel, otherwise the different 
 instances would all write into the same file.
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ped}{\code{data.frame} with three columns: id,id parent1,id parent2 }
  \item{which}{Logical vector specifying between which indiduals
    additive genetic relationship is required. Goes back through the
    whole pedigree but only for subset of individuals.
  }
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
makeA(ped,which = c(rep(FALSE,4),rep(TRUE,2)))
A <- read.table("A.txt")

if(file.exists("A.txt"))
file.remove("A.txt")

## Adjusting file name explicitly

makeA(ped,which = c(rep(FALSE,4),rep(TRUE,2)),file = 'A2.txt')
A2 <- read.table('A2.txt')

if(file.exists('A2.txt'))
file.remove('A2.txt')
}
\keyword{utilities}

