### CodeBook for Coursera's  'Getting and Cleaning Data' class assignment

This document contains the listing of the variables included in the tidy dataset.
As indicated in the README.md file for this repository, the course's tidy dataset is
based on a subset of 66 variables from the 561 variables included in the original dataset, however it
also differs from the original in the following fashions:

 * data from the 'training' and 'test' subsets merged together
 * an Activity and the SubjectID was added
 * several columns were excluded, we only retained the 66 columns which name had a reference to a mean() or a std() function.
 * The data was then averaged on the basis of Activity and SubjectId groups


The tidy dataset can be loaded into a data.frame with either a "Long" name  or
a "Short name" of the variables.  See the load_tidy.R for the R snippets that can
be used to produce either of these column names.  In all cases the data *values* are identical.

The list of variables is as follow, the name in the original dataset is also included for reference.
Note that the short name includes a integer value which is column number in the original dataset.


|OrigName|LongName|ShortName|
|--------|--------|---------|
| n/a |Activity|Activity|
| n/a |SubjectID|SubjectID|
|tBodyAcc-mean()-X|tBodyAcc.mean.X|tB_1|
|tBodyAcc-mean()-Y|tBodyAcc.mean.Y|tB_2|
|tBodyAcc-mean()-Z|tBodyAcc.mean.Z|tB_3|
|tBodyAcc-std()-X|tBodyAcc.std.X|tB_4|
|tBodyAcc-std()-Y|tBodyAcc.std.Y|tB_5|
|tBodyAcc-std()-Z|tBodyAcc.std.Z|tB_6|
|tGravityAcc-mean()-X|tGravAcc.mean.X|tG_41|
|tGravityAcc-mean()-Y|tGravAcc.mean.Y|tG_42|
|tGravityAcc-mean()-Z|tGravAcc.mean.Z|tG_43|
|tGravityAcc-std()-X|tGravAcc.std.X|tG_44|
|tGravityAcc-std()-Y|tGravAcc.std.Y|tG_45|
|tGravityAcc-std()-Z|tGravAcc.std.Z|tG_46|
|tBodyAccJerk-mean()-X|tBodyAccJerk.mean.X|tB_81|
|tBodyAccJerk-mean()-Y|tBodyAccJerk.mean.Y|tB_82|
|tBodyAccJerk-mean()-Z|tBodyAccJerk.mean.Z|tB_83|
|tBodyAccJerk-std()-X|tBodyAccJerk.std.X|tB_84|
|tBodyAccJerk-std()-Y|tBodyAccJerk.std.Y|tB_85|
|tBodyAccJerk-std()-Z|tBodyAccJerk.std.Z|tB_86|
|tBodyGyro-mean()-X|tBodyGyro.mean.X|tB_121|
|tBodyGyro-mean()-Y|tBodyGyro.mean.Y|tB_122|
|tBodyGyro-mean()-Z|tBodyGyro.mean.Z|tB_123|
|tBodyGyro-std()-X|tBodyGyro.std.X|tB_124|
|tBodyGyro-std()-Y|tBodyGyro.std.Y|tB_125|
|tBodyGyro-std()-Z|tBodyGyro.std.Z|tB_126|
|tBodyGyroJerk-mean()-X|tBodyGyroJerk.mean.X|tB_161|
|tBodyGyroJerk-mean()-Y|tBodyGyroJerk.mean.Y|tB_162|
|tBodyGyroJerk-mean()-Z|tBodyGyroJerk.mean.Z|tB_163|
|tBodyGyroJerk-std()-X|tBodyGyroJerk.std.X|tB_164|
|tBodyGyroJerk-std()-Y|tBodyGyroJerk.std.Y|tB_165|
|tBodyGyroJerk-std()-Z|tBodyGyroJerk.std.Z|tB_166|
|tBodyAccMag-mean()|tBodyAccMag.mean|tB_201|
|tBodyAccMag-std()|tBodyAccMag.std|tB_202|
|tGravityAccMag-mean()|tGravAccMag.mean|tG_214|
|tGravityAccMag-std()|tGravAccMag.std|tG_215|
|tBodyAccJerkMag-mean()|tBodyAccJerkMag.mean|tB_227|
|tBodyAccJerkMag-std()|tBodyAccJerkMag.std|tB_228|
|tBodyGyroMag-mean()|tBodyGyroMag.mean|tB_240|
|tBodyGyroMag-std()|tBodyGyroMag.std|tB_241|
|tBodyGyroJerkMag-mean()|tBodyGyroJerkMag.mean|tB_253|
|tBodyGyroJerkMag-std()|tBodyGyroJerkMag.std|tB_254|
|fBodyAcc-mean()-X|fBodyAcc.mean.X|fB_266|
|fBodyAcc-mean()-Y|fBodyAcc.mean.Y|fB_267|
|fBodyAcc-mean()-Z|fBodyAcc.mean.Z|fB_268|
|fBodyAcc-std()-X|fBodyAcc.std.X|fB_269|
|fBodyAcc-std()-Y|fBodyAcc.std.Y|fB_270|
|fBodyAcc-std()-Z|fBodyAcc.std.Z|fB_271|
|fBodyAccJerk-mean()-X|fBodyAccJerk.mean.X|fB_345|
|fBodyAccJerk-mean()-Y|fBodyAccJerk.mean.Y|fB_346|
|fBodyAccJerk-mean()-Z|fBodyAccJerk.mean.Z|fB_347|
|fBodyAccJerk-std()-X|fBodyAccJerk.std.X|fB_348|
|fBodyAccJerk-std()-Y|fBodyAccJerk.std.Y|fB_349|
|fBodyAccJerk-std()-Z|fBodyAccJerk.std.Z|fB_350|
|fBodyGyro-mean()-X|fBodyGyro.mean.X|fB_424|
|fBodyGyro-mean()-Y|fBodyGyro.mean.Y|fB_425|
|fBodyGyro-mean()-Z|fBodyGyro.mean.Z|fB_426|
|fBodyGyro-std()-X|fBodyGyro.std.X|fB_427|
|fBodyGyro-std()-Y|fBodyGyro.std.Y|fB_428|
|fBodyGyro-std()-Z|fBodyGyro.std.Z|fB_429|
|fBodyAccMag-mean()|fBodyAccMag.mean|fB_503|
|fBodyAccMag-std()|fBodyAccMag.std|fB_504|
|fBodyBodyAccJerkMag-mean()|fBodyBodyAccJerkMag.mean|fB_516|
|fBodyBodyAccJerkMag-std()|fBodyBodyAccJerkMag.std|fB_517|
|fBodyBodyGyroMag-mean()|fBodyBodyGyroMag.mean|fB_529|
|fBodyBodyGyroMag-std()|fBodyBodyGyroMag.std|fB_530|
|fBodyBodyGyroJerkMag-mean()|fBodyBodyGyroJerkMag.mean|fB_542|
|fBodyBodyGyroJerkMag-std()|fBodyBodyGyroJerkMag.std|fB_543|
  
  

For convenience, the following hints about the "Original" and/or "Long" variables names is provided below.
Please refer to the documentation of the Original study by Jorge L. Reyes-Ortiz et al. in particular the
Read.me file of the original data set, found within the following archive
<http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip>
or
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
The original site/study also provides insight about how the data was initially collected and processed.

### Variable  Naming conventions

* prefix 'f' indicates *frequency* domain signals
* prefix 't' to denote *time* based signals
* Acc   = accelerometer
* Gyro  = gyroscope
* Body  = body [of the Subject], ain BodyAcc etc. (as opposed to GravityAcc...)
* Gravity = gravity   also abbreviated 'Grav' in the "Long" names (except in 'gravityMean')
* Jerk    = jerk signal
* Mag     = magnitude
* angle   = angle (typically between to vectors)
* XYZ     = qualifies a composite signal in all 3 Dimensions
* X, Y or Z = qualities a signal in a given dimension.

Several computations are applied to the values.  Here's a list of them

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.