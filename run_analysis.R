## run_analysis.R
##   Script to automate the creation of tidy data based on data found at
##       http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
##   This is an assignment for coursera / John Hopkins University's
##     'Getting and Cleaning Data' course
##   Please stop reading if you haven't completed this assignment.
##
##
## author: mjv
## date  : 4/26/2014
##

setwd("T:/UCI HAR Dataset")

NB_OF_X_FEATURES <- 561


## Combine_y_Subj_X
##   Produces a data.frame which combines the data from the
##      y file   (the Activity)
##      subject  (the Subject ID)
##      X file   (the measured and computed values)
##  Arguments:
##      setPrefix (character) Either "train" or "test" corresponding to the
##          train and test datasets respectively.
##          Note the underlying directory and file names are implied:
##                <prefix>/subject_<prefix>.txt  for the subjectId file
##                <prefix>/subject_X.txt         for the X file
##                <prefix>/y_<prefix>.txt        for the y file
##             (these paths are relative to the current work directory)
##      activityLabels (character vector) a vector with exactly 6 string one each
##              for the 1-thru-6 activity codes. When this vector is not NULL, the
##              Activity codes found in the input data is converted to a factor
##              with the corresponding labels.
##      X.names (character vector) column names for the data from the X file;
##              must be exactly NB_OF_X_FEATURES elements long
##      y.name  (character)   name for the column read from the y file
##      subj.name (character) name for the column read from the subject file
##      
##  Return value: a data.frame with as many rows as the input files (these three
##      files should all have the same values) and with 2 columns more than the X
##      file (1 each for the y value and for the Subject Id).  Optionally, the value
##      for the activity can be converted to a factor (see activityLabels argument)
##
Combine_y_Subj_X <- function(setPrefix, activityLabels, X.names, 
                             y.name="Activity", subj.name="SubjectID") {
    # basic argument check
    if (!tolower(setPrefix) %in% c("train", "test"))
        error(sprintf("Bad 'setPrefix' argument [%s], expecting 'train' or 'test'", setPrefix))
    if (length(activityLabels) != nrow(Activity.Labels))
        error(sprintf("Bad 'activityLabels' argument; should be a vector with exactly %d elements",
                      nrow(activity.Labels)))
    if (length(X.names) != NB_OF_X_FEATURES)
        error(sprintf("Bad 'X.names' argument; should be a character vector with exactly %d elements",
                      NB_OF_X_FEATURES))
    
    # ** .fn : file names (actually [relative] paths to the files)
    X.fn <-    sprintf("%s/X_%s.txt", setPrefix, setPrefix)
    y.fn <-    sprintf("%s/y_%s.txt", setPrefix, setPrefix)
    subj.fn <- sprintf("%s/subject_%s.txt", setPrefix, setPrefix)
    
    X <- read.table(X.fn, header=FALSE, col.names=X.names, stringsAsFactors = FALSE)
    #X <- read.fwf(X.fn, 16, header=FALSE, col.names=X.names, stringsAsFactors = FALSE)
    y <- read.table(y.fn, header=FALSE, col.names=y.name, stringsAsFactors = FALSE)
    subj <- read.table(subj.fn, header=FALSE, col.names=subj.name, stringsAsFactors = FALSE)
    
    if (nrow(X) != nrow(y) || nrow(X) != nrow(subj))
        error(sprintf("Mismatch in number of rows retrieved for X,y and Subj; respectively %d, %d, %d"),
              nrow(X), nrow(y), nrow(subj))
    
    if (!is.null(activityLabels)) {
        y[,y.name] <- factor(y[,y.name], 1:nrow(Activity.Labels), labels=activityLabels)
    }
    
    retVal <- cbind(y, subj, X)
    retVal
}


## ***** Load the Ativity Labels *****
Activity.Labels <- read.table("activity_labels.txt", 
                               header = FALSE, sep = " ", quote = "\"'",
                               col.names = c("ActivityId", "Name"),
                               stringsAsFactors = FALSE)
# note: hardcoding these somehow defeats the purpose of loading them from the
#       original file, but... good enough !
Activity.Labels$ShortName <- c("Walk", "Walk_up", "Walk_down", "Sit", "Stand", "Lay")

## ***** Produce feature Names  *****
## The original dataset's 'features.txt' provide a relatively self explanatory -if
## only- somewhat long, name for each of the 561 variables found in each of the
## lines of the X_test and X_train files.
## These names are slightly edited here, as so to be syntactically acceptable R identifiers
## It may have been more expedient but less flexible to use make.names().
## FeaturesDf, after all transformations also includes:
##   - a $ShortName column which includes the column number in the original datasets and which
##     is much shorter than the $LongName and can be rather useful in several contexts.
##   - a $InNewDataSet column, to indicate that the column is included in the dataset produced
##     for this course assignement.

featuresDf <- read.table("features.txt", 
                         header = FALSE, sep = " ", quote = "\"'",
                         col.names = c("FeatId", "OrigName"),
                         stringsAsFactors = FALSE)
featuresDf$LongName <- gsub("(\\(\\))([1-4])", ".\\2", featuresDf$OrigName)   # '()1' to '.1' and the like
featuresDf$LongName <- gsub("(\\(\\))", "", featuresDf$LongName)      # drop all remaining '()'
featuresDf$LongName <- gsub("([\\(\\)])", "_", featuresDf$LongName)   # remaining '(' or ')' to '_'
featuresDf$LongName <- gsub("-", ".", featuresDf$LongName)            # dashes to dots
featuresDf$LongName <- gsub("([XYZ]),([1-4])","\\1\\2", featuresDf$LongName)  # suppr comma in 'X,1' or 'Z,4' and the like
featuresDf$LongName <- gsub(",", "_", featuresDf$LongName)            # remaining commas to '_'
featuresDf$LongName <- gsub("Gravity", "Grav", featuresDf$LongName)   # truncate 'Gravity' making it 4 chars just like Body

# ShortName is first two characters of Original Name plus the FeatId
# This boils down to 4 prefixes: fB, tB, tG and an  (for respectively fBodyxxx tBodyxxx tGrav... and angle)
# Such prefixes provide a mild check/mnemonic on the [partial] nature of the feature 
featuresDf$ShortName <- paste0(substr(featuresDf$OrigName, 1, 2), "_", as.character(featuresDf$FeatId))

# NOTE: There is some ambiguity about which "mean" and "std" columns we need to retain.
#   A consensus on the forum seemed to form around the idea of only taking the columns which
#   include eitherr the "mean()" or "std()" pattern, i.e. which the parenthesis, hence excluding
#   several references such as "meanFreq()" or "gravityMean"
# The InNewDataSet columns allows to easily include or exclude particular columns from the original set
# hence we could easily re-run the script after modifiying the regular expression, to recreate the
# desired data (and its supporting features "catalog")
featuresDf$InNewDataSet <- grepl("(mean\\(\\)|std\\(\\))", featuresDf$OrigName, ignore.case=FALSE)


## ***** Produce 'new.all' an intermediate dataset which is made of all the rows and
## ***** the desired columns from both the training and test data sets, onto which we
## ***** tack-on the corresponding Actvivity (aka "y") and the SubjectId.

train.all <- Combine_y_Subj_X("train", Activity.Labels$ShortName, featuresDf$LongName)
# notice the two extra TRUE to include activity and SubjectId
train.new <- train.all[, c(TRUE, TRUE, featuresDf$InNewDataSet)]

test.all <- Combine_y_Subj_X("test", Activity.Labels$ShortName, featuresDf$LongName)
test.new <- test.all[, c(TRUE, TRUE, featuresDf$InNewDataSet)]

new.all <- rbind(train.new, test.new)
# dispose of these big objects since they are not needed anymore
rm(train.all, train.new, test.all, test.new)   

## ***** Creates a second, independent, tidy data set with the average of each of the
## ***** variables in the intermediate dataset,  for each activity and subject combination.
## ***** The expected dimensions of the resulting data.frame are
## *****    180 rows (i.e. 30 subjects times 6 activities, since all Subjects did all 6 activities)
## *****  x  68 cols (i.e. 2 + 66, for the Activity and SubjectID col, followed by 66 numeric variables)
new.aggr_avgs <- ddply(new.all, .(SubjectID, Activity), colwise(mean), .inform = TRUE)

## ***** Writes the new aggregated dataset to CSV file
write.csv(new.aggr_avgs, file="tidy.txt", row.names=FALSE)

## ***** Write a small file with the three versions of the column names (short, long and original)
## 
names.short <- c(colnames(new.aggr_avgs)[1:2], featuresDf[featuresDf$InNewDataSet,]$ShortName)
names.long  <- c(colnames(new.aggr_avgs)[1:2], featuresDf[featuresDf$InNewDataSet,]$LongName)
names.orig  <- c(colnames(new.aggr_avgs)[1:2], featuresDf[featuresDf$InNewDataSet,]$OrigName)
write.table(rbind(names.short, names.long, names.orig), file="AltColNames.txt", row.names=FALSE, col.names=FALSE, sep=",")

print("Completed tidy dataset production. The new dataset is found in 'tidy.txt'")
print("See 'README.md' and 'CodeBook.md' for more details.")


