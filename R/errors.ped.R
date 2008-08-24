`errors.ped` <-
function(ped)
  {
    if(ncol(ped)!=3)stop("pedigree should have 3 columns")
    f <- rep(0,nrow(ped))
    m <- rep(0,nrow(ped))
    dams <- tapply(ped[,2],ped[,2],length)
    di <- match(names(dams),ped[,1])
    dams <- dams[!is.na(di)]
    di <- di[!is.na(di)]
    f[di] <- dams
    
    sires <- tapply(ped[,3],ped[,3],length)
    si <- match(names(sires),ped[,1])
    sires <- sires[!is.na(si)]
    si <- si[!is.na(si)]
    m[si] <- sires
    fm <- data.frame(f,m)
    
    e <- f!=0&m!=0
    if(any(e))warning("some dams are sires")
  }

