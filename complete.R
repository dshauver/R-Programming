################################################################################
complete <- function(directory, id = 1:332 ) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

	## Return a data frame of the form:
	## id nobs
	## 1  117
	## 2  1041
	## ...
	## where 'id' is the monitor ID number and 'nobs' is the
	## number of complete cases

	x <- ("id")
	y <- ("nobs")

	for (i in id) {

		x <- c(x, i)
		## Filenames are 3 digits - 001 through 332.  Force id to 3 digits
		##id <- sprintf("%03d", i)

		y <- c(y, (nrow(na.omit(read.csv(paste(directory,(paste((sprintf("%03d", i)),"csv",sep = ".")),sep = "/"))))))
	}
	m <- data.frame(cbind(x,y))
	write.table(m, quote = FALSE, col.names = FALSE)
}
