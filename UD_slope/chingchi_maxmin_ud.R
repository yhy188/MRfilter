#Although the code is not optimal, it should be able to get a good design with a small run size.

# all points
# X1:1~16
# X2:1~12
# X1>X2
#check <- 15
check <- 10-1# -1; 16-11=15
for(i in 2:16){
  check[i] <- check[i-1]+(16-i)
}

all <- expand.grid(1:16,1:12)
sub <- all[apply(all, 1, function(v) v[1]>=v[2]),]
list <- (1+8191*0:check) %% 126
ini <- sub[list,]

PotentialPointAdd <- lapply(seq_len(nrow(sub)), function(i) sub[i,])

library(foreach)
library(doParallel)
numCores <- detectCores()
registerDoParallel(numCores)  # use multicore, set to the number of our cores

# could change 100 to as many as possible
for (rep in 1:100){
  mini <- min(dist(ini))
  PointRemoved <- sum(check <= which(dist(ini) == mini)[1])+1
  iniR <- lapply(seq_len(nrow(ini[-PointRemoved,])), function(i) ini[-PointRemoved,][i,])

  result <- foreach (i = PotentialPointAdd, .packages = c("foreach")) %dopar% {
    dis <- foreach(j = iniR) %dopar% {
      sum((j- i)^2)
    }
    min(unlist(dis))
  }

  iniR[[16]] <- sub[which.max(unlist(result)),]
  ini <- do.call(rbind, iniR)
}


plot((ini), xlim=c(0,16), ylim=c(0,16))
abline(h = c(0, 12))
abline(0,1)
abline(v = 16)


