#USAGE Rscript corrida_local.R "tabla_entrada.csv" "tabla_salida.csv"
.args <- commandArgs(TRUE)
#print(.args1[1])
SPCA(.args[1], .args[2])
cat("\ntermino de correr el pronostico\n")
post()
