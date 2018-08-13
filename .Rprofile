
Sys.setenv("SPCA_HOME" = normalizePath(getwd()))

.First <- function(){
  
  if(.Platform$OS.type == "windows") options(encoding = "utf-8")
  
  SPCA_HOME <- Sys.getenv("SPCA_HOME")
  
  if(any(grepl("Spanish", Sys.getlocale())))  Sys.setlocale("LC_ALL","English")

  library(datasets); library(utils); library(grDevices); library(graphics); library(stats)

  .libPaths("lib")

  ##instalacion de dependencias----
  installed.pkgs <- utils::installed.packages("lib")
  
  if(.Platform$OS.type == "unix"){
    pkgs.files <- list.files(paste(SPCA_HOME, "/src/contrib", sep = ""))
    pkgs <- gsub(".tar.gz", "", pkgs.files)
  }
   else{
     versionr <- R.Version()
     ver <- paste(versionr$major, as.character(floor(as.numeric(versionr$minor))), sep = ".")
     pkgs.files <- list.files(paste(SPCA_HOME, "/bin/windows/contrib/", ver, sep = ""))
     pkgs <- gsub(".zip", "", pkgs.files)
   }
  
  paquete <- installed.pkgs[ ,"Package"]
  version <- installed.pkgs[ ,"Version"]
  cuales <- pkgs %in% paste(paquete, version, sep = "_")

  while(!all(cuales)){
    
    #instalacion
    for(i in pkgs.files[!cuales]){
      if(.Platform$OS.type == "unix")
        cmd <- paste("R --no-init-file CMD INSTALL -l lib  --no-test-load src/contrib/", i, sep = "")
         else
           cmd <- paste("R --no-init-file CMD INSTALL -l lib --no-test-load bin/windows/contrib/", ver, "/", i, sep = "")
      system(cmd)
    }
    
    installed.pkgs <- utils::installed.packages("lib")
    paquete <- installed.pkgs[ ,"Package"]
    version <- installed.pkgs[ ,"Version"]
    cuales <- pkgs %in% paste(paquete, version, sep = "_")
  }
  
  library(datasets); library(utils); library(grDevices); library(graphics); library(stats)
  #.libPaths("lib")
  library(forecast)
  library(tree)
  library(zoo)
  
  ### -- Carga del código de SPCA -- ####
  source("scripts/init.R")      
  
}
