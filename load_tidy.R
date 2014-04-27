## load_tidy.R   Snippets to dataset found in read tidy.txt, optionally using
## alternative column names

# by default the file comes with the "Long" names
df.withLongNames <- read.csv("tidy.txt")

# AltColNames.txt gives us all 3 possible sets of names...
df.altNames <- read.table("AltColNames.txt", sep=",")

# ...which we can then use to alter the colnames of the tidy dataset
# here with the "Short" names which are quite useful, by being both short but
# also refering to the column number in the original set.
df.withShortNames <- read.csv("tidy.txt");  colnames(df.withShortNames) <- t(df.altNames[1,])

# Note that in the case of the Original Names, these are modified by the implicit make.names()
# in other words, the names found in df.altNames[3,] are not used verbatim.
df.withAlmostOrigNames <- read.csv("tidy.txt");  colnames(df.withShortNames) <- t(df.altNames[3,])
head(df.withAlmostOrigNames)