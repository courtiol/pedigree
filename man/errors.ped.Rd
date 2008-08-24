\name{errors.ped}
\alias{errors.ped}
\title{Function to check for errors in a pedigree data.frame }
\description{
  Function \code{errors.ped} checks for errors in a pedigree and finds double coded
  parents: non-founders that are both dam and sire. Returns true or
  false, and you should remove errors yourself.
}
\usage{
errors.ped(ped)
}
\arguments{
  \item{ped}{\code{data.frame} with three columns: id,id parent1,id parent2}
}
\value{
  \code{Logical} TRUE if no errors, FALSE if errors exist in the pedigree}
\seealso{\code{\link{add.Inds}}}
\examples{
ID <- 1:5
DAM <- c(0,0,1,1,3)
SIRE <- c(0,0,1,2,3)
pedigree <- data.frame(ID,DAM,SIRE)
errors.ped(pedigree)
}
\keyword{utilities}
