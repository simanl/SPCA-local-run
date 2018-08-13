ultimas.horas <- function(x = "O3Obispado"){
	load(normalizePath(paste("tablas/series/", x, ".RData", sep = "")))
	x <- get(x)
	ultimas.horas <- tail(x$tabla.horaria.sitio)[, c("fecha", "hora")]
	rownames(ultimas.horas) <- NULL
	return(ultimas.horas)
}
