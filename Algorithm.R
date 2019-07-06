install.packages("readtext")    # data preparation
install.packages("quanteda")    # data preparation and analysis

library(readtext) 
library(quanteda)

##reading all the files of all extensions obtained from sources and converting them into text files
filepath <- list.files("C:/Users/Public/master_unzip_java_files/", pattern="\\.java$", recursive = TRUE, full.names = TRUE)
file.rename(filepath,paste0(filepath,".txt"))
filepath1 <- list.files("C:/Users/Public/master_unzip_c_files/", pattern="\\.c$", recursive = TRUE, full.names = TRUE)
file.rename(filepath1,paste0(filepath1,".txt"))
filepath2 <- list.files("C:/Users/Public/master_unzip_js_files/", pattern="\\.js$", recursive = TRUE, full.names = TRUE)
file.rename(filepath2,paste0(filepath2,".txt"))
filepath3 <- list.files("C:/Users/Public/master_unzip_py_files/", pattern="\\.py$", recursive = TRUE, full.names = TRUE)
file.rename(filepath3,paste0(filepath3,".txt"))

##reading java files
temp <- list.files("C:/Users/Public/master_unzip_java_files/", pattern="*.txt$",full.names = TRUE)
temp 

##allocating random .txt to variables a(1:9)
#assign few files to be tested to a(1:9) variables
a1 <- "C:/Users/Public/master_unzip_java_files/AbstractListMultimap.java.txt"
a2 <- "C:/Users/Public/master_unzip_java_files/OpenJdk6SetTests.java.txt" 
a3 <- "C:/Users/Public/master_unzip_java_files/package-info.java.txt"
a4 <- "C:/Users/Public/master_unzip_java_files/PackageSanityTests.java.txt"
a5 <- "C:/Users/Public/master_unzip_java_files/Multisets.java.txt"
a6 <- "C:/Users/Public/master_unzip_java_files/ObjectCountHashMap.java.txt"
a7 <- "C:/Users/Public/master_unzip_java_files/MultimapPutIterableTester.java.txt" 
a8 <- "C:/Users/Public/master_unzip_java_files/DirectedNetworkConnections.java.txt"
a9 <- "C:/Users/Public/master_unzip_java_files/CommonPattern.java.txt"

#reading all the variables a(1:9) into a single variable w
w <- c(a1, a2, a3, a4, a5, a6, a7, a8, a9)

#applying readtext to read all documents from w to rt
rt <- readtext(w, text_field = "texts") 

#applying quanteda's corpus 
fulltext <- corpus(rt)                             
dtm <- dfm(fulltext) 
dtm

#results - Java
myDict <- dictionary(list(import = c("import*"), 
                          node = c("node*"), Override = c("@Override*"))) 
dict_dtm <- dfm_lookup(dtm, myDict) 
dict_dtm

#########################################################################################################################
#Testing for C files
#reading c files
temp1 <- list.files("C:/Users/Public/master_unzip_c_files/", pattern="*.txt$",full.names = TRUE)
temp1 

##allocating random .txt to variables b(1:9)
#assign few files to be tested to b(1:9) variables
b1 <-  "C:/Users/Public/master_unzip_c_files/bq27xxx_battery_i2c.c.txt"
b2 <- "C:/Users/Public/master_unzip_c_files/bond_alb.c.txt" 
b3 <- "C:/Users/Public/master_unzip_c_files/bnxt_xdp.c.txt"
b4 <- "C:/Users/Public/master_unzip_c_files/bme680_i2c.c.txt"
b5 <- "C:/Users/Public/master_unzip_c_files/bman_test.c.txt"
b6 <-  "C:/Users/Public/master_unzip_c_files/blacklist.c.txt"
b7 <- "C:/Users/Public/master_unzip_c_files/bfa_ioc_ct.c.txt" 
b8 <-  "C:/Users/Public/master_unzip_c_files/bdc_core.c.txt"
b9 <- "C:/Users/Public/master_unzip_c_files/bcm87xx.c.txt"

#reading all the variables b(1:9) into a single variable x
x <- c(b1, b2, b3, b4, b5, b6, b7, b8, b9)

#applying readtext to read all documents from x to rt1
rt1 <- readtext(x, text_field = "texts") 

#applying quanteda's corpus 
fulltext1 <- corpus(rt1)                             
dtm1 <- dfm(fulltext1) 
dtm1

#results - C
myDict1 <- dictionary(list(errorsplusplus = c("errors*"), 
                          linux = c("linux*"), define = c("#define*"))) 
dict_dtm1 <- dfm_lookup(dtm1, myDict1) 
dict_dtm1

######################################################################################################################
#Testing for Java Script files
#reading java script files
temp2 <- list.files("C:/Users/Public/master_unzip_js_files/", pattern="*.txt$",full.names = TRUE)
temp2 

##allocating random .txt to variables c(1:9)
#assign few files to be tested to c(1:9) variables
c1 <- "C:/Users/Public/master_unzip_js_files/build.js.txt"
c2 <- "C:/Users/Public/master_unzip_js_files/buffer.js.txt" 
c3 <- "C:/Users/Public/master_unzip_js_files/buffer-compare-offset.js.txt"
c4 <- "C:/Users/Public/master_unzip_js_files/bottom-bar.js.txt" 
c5 <- "C:/Users/Public/master_unzip_js_files/block-stream.js.txt"
c6 <- "C:/Users/Public/master_unzip_js_files/block-scoping-sloppy.js.txt"
c7 <- "C:/Users/Public/master_unzip_js_files/block-for.js.txt"
c8 <- "C:/Users/Public/master_unzip_js_files/bindKey.js.txt"
c9 <- "C:/Users/Public/master_unzip_js_files/_arrayReduce.js.txt"

#reading all the variables b(1:9) into a single variable y
y <- c(c1, c2, c3, c4, c5, c6, c7, c8, c9)

#applying readtext to read all documents from y to rt2
rt2 <- readtext(y, text_field = "texts") 

#applying quanteda's corpus 
fulltext2 <- corpus(rt2)                             
dtm2 <- dfm(fulltext2) 
dtm2

#results - Java Script
myDict2 <- dictionary(list(param = c("@param*"), 
                           var = c("var*"))) 
dict_dtm2 <- dfm_lookup(dtm2, myDict2) 
dict_dtm2


#########################################################################################################################
#Testing for Python files
#reading python script files
temp3 <- list.files("C:/Users/Public/master_unzip_py_files/", pattern="*.txt$",full.names = TRUE)
temp3 

##allocating random .txt to variables d(1:9)
#assign few files to be tested to d(1:9) variables
d1 <- "C:/Users/Public/master_unzip_py_files/test_codecs.py.txt"
d2 <- "C:/Users/Public/master_unzip_py_files/test_base64.py.txt"
d3 <- "C:/Users/Public/master_unzip_py_files/struct.py.txt"
d4 <- "C:/Users/Public/master_unzip_py_files/rot_13.py.txt"
d5 <- "C:/Users/Public/master_unzip_py_files/DetailsViewer.py.txt"
d6 <- "C:/Users/Public/master_unzip_py_files/cProfile.py.txt"
d7 <- "C:/Users/Public/master_unzip_py_files/cp1026.py.txt"
d8 <- "C:/Users/Public/master_unzip_py_files/chaos.py.txt"
d9 <- "C:/Users/Public/master_unzip_py_files/_bootstrap_external.py.txt"

#reading all the variables d(1:9) into a single variable z
z <- c(d1, d2, d3, d4, d5, d6, d7, d8, d9)

#applying readtext to read all documents from z to rt3
rt3 <- readtext(z, text_field = "texts") 

#applying quanteda's corpus 
fulltext3 <- corpus(rt3)                             
dtm3 <- dfm(fulltext3) 
dtm3

#results - Python
myDict3 <- dictionary(list(getattr = c("getattr*"), 
                           setattr = c("setattr*"), backslash_n = c("\n*"))) 
dict_dtm3 <- dfm_lookup(dtm3, myDict3) 
dict_dtm3

###########################################################################################################################