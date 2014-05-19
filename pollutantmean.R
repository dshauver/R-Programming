################################################################################
pollutantmean <- function(directory, pollutant, id = 1:332, clean=FALSE) {
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

	dataset <- data.frame()

	for (i in id) {	

		if (!clean) {

			## Read in entire dataset, including incomplete/NA data.

			dataset <- rbind(dataset, read.csv(paste(directory,(paste(sprintf("%03d", i),"csv",sep=".")),sep="/")))

		} else {

			## Read the files into the dataset, removing imcomplete data points
			dataset <- rbind(dataset, na.omit(read.csv(paste(directory,(paste(sprintf("%03d", i),"csv",sep=".")),sep="/"))))

		}
	}

	mean(dataset[[pollutant]], na.rm=TRUE)
}
