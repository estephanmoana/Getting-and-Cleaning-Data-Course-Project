# READ ME
 This README file describes how the scripts for the "Getting and Cleaning Data" Course Project work and how they are connected.
 * run_analysis.R: R script that performs all the data transformations done to the project's raw dataset: Human Activity Recognition Using Smartphones Dataset Version 1.0. It also generates a tidy data text file that meets the principles of Tidy Data <Wickham, H. (2014). Tidy Data. Journal of Statistical Software, 59(10), 1 - 23. doi:http://dx.doi.org/10.18637/jss.v059.i10>
* Codebook.md: describes the variables, the data, and transformations/work performed to clean up the raw data and produce the tidy dataset described below.
* "TidyDataset.txt": text file containing the tidy data set with the average of each variable for each activity and each subject.
    > Note: This tidy dataset is in the long form, please bear in mind that it is mentioned in the assignment's rubric that either long or wide form datasets are acceptable

The tidy dataset can be viewed in R with the following code (it assumes that the file "TidyDataset.txt" is saved within the current working directory):

    > data <- read.table("TidyDataset.txt", header = TRUE)
    > View(data)