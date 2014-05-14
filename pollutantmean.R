################################################################################
pollutantmean <- function(directory, pollutant, id = 1:332, naRem = TRUE) {
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

	## Filenames are 3 digits - 001 through 332.  Force id to 3 digits
	id <- sprintf("%03d", id)

	## Assume sensor failure or adverse environmental conditions on partial readings.
	## Ignore incomplete readings
	dataset <- na.omit(read.csv(paste(directory,(paste(id,"csv",sep = ".")),sep = "/")))

	## Read in entire dataset, including incomplete/NA portions.
	## dataset <- read.csv(paste(directory,(paste(id,"csv",sep = ".")),sep = "/"))

	##Validating operation
	##dataset
	##colnames(dataset)

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

	##requires mean(dataset$pollutant), where pollutant is evaluated.
	mean(dataset[[pollutant]])

	##Below variant for use if we don't clean incomplete datasets on read.
	##mean(dataset[[pollutant]], na.rm = naRem)

}
