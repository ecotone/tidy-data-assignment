tidy-data-assignment
====================

This repository is provided in fulfillment of the peer review assignment for  
*Coursera / John Hopkins University* **Getting and Cleaning Data** *course*  (April 2014)   
Instructors:  Jeff Leek, Roger D. Peng and Brian Caffo

###Overview

The goal of the assignment is to demonstrate the student's ability to create a *tidy datatset*.
The input data for this task is found at  
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and was originally obtained from  
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> .   
See the above site for details on the genesis of the **original data**.  Essentially, it is a set of multivariate time-series made of normalized measurements and computed values related to recordings from a smartphone-embedded accelerometer and gyroscope.  The original data was gathered and processed by the individuals credited below, for the purpose of asserting how Machine Learning can be applied to classify the activity of an individual carrying a smartphone or similar devices (such as *Walking* vs. *Walking up/down*, vs. *Sitting* etc.).

*The tidy dataset produced for the course assignment was made by...*:

* ...merging the 'training' and 'test' subsets of the original
* ...providing a header for each of the data columns, within the new data file.  (Indeed provided two headers: one with "long names" very similar to the names used in the original study, and one with short names referencing the column number in the original dataset)
* ...combining the activity code, and the subject id with the variables' table
* ...re-labeling the activity values with a descriptive text rather than the original 1-thru-6 code.
* ...subsetting, by taking only the columns which represent either a computed average or standard deviation value in the original dataset (retained 66 variables from the original's 561 variables).
* ...saving the new dataset as a CSV file for ease of import (fixed width format akin to that of the original wasn't applicable anymore owing to the headers). 

### Files found in this repo
|File name|Description|
|---------|-----------|
|CodeBook.md| Markdown file with the catalog of the variables included in the new and original datasets.|
|run_analysis.R| R script used to perform dataset conversion |
|load_tidy.R| R script with the idioms used to load the tidy dataset from tidy.txt, giving it alternate column names if desired|
|-|-|
|tidy.txt| A CSV-formated file with the tidy data, with the "long" column names as header|
|AltColNames.txt| A text file with 3 alternative sets of column names for the tidy data (see load_tidy.R)|
|-|-|
|README.md| The very file you are reading|

### Alternative column names
The names of the variables in the original data are generally self descriptive but also rather long. Depending on intentded use it may be useful to refer to these variable using different names:

 * a Short name, mostly based on the column number in the original dataset.
 * a Long name, derived from the original column name, modified to be R-syntax compatible (for e.g. the original names included parenthesis characters which are not allowed in data.frame's colnames.)
 * the original file name.
 
By default, loading *tidy.txt* using  *read.csv()* produces a data.frame with the "Long" names.
See the load_tidy.R to view the code snippets that allow loading the alternate names and assigning them to the data.frame.


###Credits
**Original dataset produced by:**  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
*Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine*.  Int'l Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
