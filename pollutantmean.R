################################################################################
pollutantmean <- function(directory, pollutant, id = 1:332, clean=TRUE) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

	##Not checking to see if directory is a valid path.  
	##getwd() should be the parent of "directory" or use absolute path.

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
	## Currently only processing a single input, has to exact match
	## initial component of file name.  Need to handle range of ID
	## numbers, pattern match for input files.  i.e. 1 = 001.csv.

	## 'clean' is a logical value.  If true, assume that any datapoints with
	## NA values in any column correspond to error conditions, either due
	## to sensor fault, adverse environmental conditions, or data transfer
	## issues.

	## The below appears to work in all instances.  Will look into tightening
	## up code with lapply function.
	for (i in id) {

		## Filenames are 3 digits - 001 through 332.  Force id to 3 digits
		id <- sprintf("%03d", i)

		if (!clean) {

			## Read in entire dataset, including incomplete/NA data.
			dataset <- read.csv(paste(directory,(paste(id,"csv",sep = ".")),sep = "/"))

		} else {

			dataset <- na.omit(read.csv(paste(directory,(paste(id,"csv",sep = ".")),sep = "/")))
			
		}
		
	}

	mean(dataset[[pollutant]], na.rm=TRUE)
	
}
