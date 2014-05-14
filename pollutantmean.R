pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

	##Not checking to see if directory is a valid path.  
	##getwd() should be the parent of "directory"
	##or absolute path should be used.

	##Validating input 1
	##print(directory)

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

	##Validating input 2
	##print(pollutant)

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
	## Currently only processing a single input, has to exact match
	## initial component of file name.  Need to handle range of ID
	## numbers, pattern match for input files.  i.e. 1 = 001.csv.

	##Validating input 3
	##print(id)

	##Create a filename to be used for import
	##filename <- paste(directory,(paste(id,"csv",sep = ".")),sep = "/")
	##Validating operation
	##print(filename)

	##Read in the dataset
	##rawdata <- read.csv(filename)
	##Clean the data
	##dataset <- rawdata[(complete.cases(rawdata)), ]

	##Elegant - read in data with lines containing "NA" omitted
	dataset <- na.omit(read.csv(paste(directory,(paste(id,"csv",sep = ".")),sep = "/")))

	##Validating operation
	##dataset
	##colnames(dataset)

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

	##Ignored all incomplete datasets above ; this implies that we're
	##looking for the mean across all datasets, even if incomplete.
	##Have confirmed that in at least 1 dataset (001.csv) :
	##	mean(rawdata$nitrate, na.rm = TRUE)
	##	does not equal
	##	mean(dataset$nitrate) when na.omit is used on file read.
	
	##requires mean(dataset$pollutant), where pollutant is evaluated.
	mean(dataset[[pollutant]])

}
