install.packages("ggplot2")
install.packages("plotly")
install.packages("plyr")
install.packages("flexdashboard")

library(ggplot2)
library(plotly)
library(plyr)
library(flexdashboard)


## downloading the respective .zips from the references provided (core libraries)

setwd("C:/Users/Public")

url1 <- c("https://github.com/google/guava/archive/master.zip")
url2 <- c("https://github.com/torvalds/linux/archive/master.zip")
url3 <- c("https://github.com/nodejs/node/archive/master.zip")
url4 <- c("https://github.com/python/cpython/archive/master.zip")

download.file(url1, destfile = "java.core.zip" )
download.file(url2, destfile = "c.core.zip")
download.file(url3, destfile = "js.core.zip")
download.file(url4, destfile = "py.core.zip")

## unzipping the core libraries

zippedfile1<- "C:/Users/Public/java.core.zip"
outDir<-"C:/Users/Public/master_unzip_java"
unzip(zippedfile1,exdir=outDir)

zippedfile2<- "C:/Users/Public/c.core.zip"
outDir<-"C:/Users/Public/master_unzip_c"
unzip(zippedfile2,exdir=outDir)

zippedfile3<- "C:/Users/Public/js.core.zip"
outDir<-"C:/Users/Public/master_unzip_js"
unzip(zippedfile3,exdir=outDir)

zippedfile4<- "C:/Users/Public/py.core.zip"
outDir<-"C:/Users/Public/master_unzip_py"
unzip(zippedfile4,exdir=outDir)

## extracting the files of particular extension and storing them into folders

filenames <- list.files("C:/Users/Public/master_unzip_java/guava-master/", pattern="\\.java$", recursive = TRUE, full.names = TRUE)
dir.create("C:/Users/Public/master_unzip_java_files/")
file.copy(filenames, "C:/Users/Public/master_unzip_java_files/")

filenames1 <- list.files("C:/Users/Public/master_unzip_c/linux-master", pattern="\\.c$", recursive = TRUE, full.names = TRUE)
dir.create("C:/Users/Public/master_unzip_c_files/")
file.copy(filenames1, "C:/Users/Public/master_unzip_c_files/")

filenames2 <- list.files("C:/Users/Public/master_unzip_js/node-master", pattern="\\.js$", recursive = TRUE, full.names = TRUE)
dir.create("C:/Users/Public/master_unzip_js_files/")
file.copy(filenames2, "C:/Users/Public/master_unzip_js_files/")

filenames3 <- list.files("C:/Users/Public/master_unzip_py/cpython-master", pattern= "\\.py$", recursive = TRUE, full.names = TRUE)
dir.create("C:/Users/Public/master_unzip_py_files/")
file.copy(filenames3, "C:/Users/Public/master_unzip_py_files/")

## counting the number of files for data exploration and to produce a simple dashboard

count.filenames <- list.files("C:/Users/Public/master_unzip_java/guava-master/", recursive = TRUE, full.names = TRUE)
Number.files.Java.Core.Library <- length(count.filenames)
Number.files.Java <- length(filenames)

count.filenames1 <- list.files("C:/Users/Public/master_unzip_c/linux-master/", recursive = TRUE, full.names = TRUE)
Number.files.c.Core.Library <- length(count.filenames1)
Number.files.c <- length(filenames1)

count.filenames2 <- list.files("C:/Users/Public/master_unzip_js/node-master/", recursive = TRUE, full.names = TRUE)
Number.files.js.Core.Library <- length(count.filenames2)
Number.files.js <- length(filenames2)

count.filenames3 <- list.files("C:/Users/Public/master_unzip_py/cpython-master/", recursive = TRUE, full.names = TRUE)
Number.files.py.Core.Library <- length(count.filenames3)
Number.files.py <- length(filenames3)


## creating a small dataframe for bar plots to depict the number of files
#all the files in the master zip 
Name_of_Source_Library <- c("CORE JAVA LIBRARY FILES", "CORE C LIBRARY FILES", "CORE JS LIBRARY FILES", "CORE PY LIBRARY FILES")
Number_of_Files <- c(Number.files.Java.Core.Library, Number.files.c.Core.Library, Number.files.js.Core.Library, Number.files.py.Core.Library)
core.dataframe <- data.frame(Name_of_Source_Library,Number_of_Files)

a <- ggplot(data=core.dataframe, aes(Name_of_Source_Library,Number_of_Files)) +
  geom_bar(stat="identity", fill="steelblue", width = 0.7)+
  geom_text(aes(label=Number_of_Files), vjust=5, color="black", size=3.5)+
  theme_minimal()

ggplotly(a)

#required ext files in master zip
Name_of_Files <- c("JAVA FILES", "C FILES", "JS FILES", "PY FILES")
Number_of_Files_with_desired_ext <- c(Number.files.Java, Number.files.c, Number.files.js, Number.files.py)
required.dataframe <- data.frame(Name_of_Files,Number_of_Files_with_desired_ext)

b <- ggplot(data=required.dataframe, aes(Name_of_Files,Number_of_Files_with_desired_ext)) +
  geom_bar(stat="identity", fill="steelblue", width = 0.7)+
  geom_text(aes(label=Number_of_Files_with_desired_ext), vjust=1.6, color="white", size=3.5)+
  theme_minimal()
