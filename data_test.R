#
# Unit test for behavior data in PC two-dim learning experiment
#
# Author: Xiaokai Xia (xia@xiaokai.me) at 
#         Lingwang's computational Neuroscience Lab in SCNU
#
# Describe: This script is designed for cheak the correctness of 
#           the behavior experiment data 
#

####################### Prepare work #############################

# function of read data
read_data_to_RT_code <- function(log_file = file.choose()){
  foo <- readLines(log_file)
  RT_start <- which(stringr::str_detect(foo, "RT"))
  RT_table <- readr::read_delim(log_file, delim = "\t", skip = RT_start-1)
  RT_code <- as.data.frame(RT_table$Code[grepl("Space.*",RT_table$Code)])
  names(RT_code) <- "RT_code"
  return(RT_code)
}

RT_code <- read_data_to_RT_code()

# Making the table of each condition
split_by <- list(c(1:32),c(33:672),c(673:1312))
#split_RT_code <- function(RT_code = RT_code, split_by = split_by){
  for(i in 1:length(split_by)){
    print(table(RT_code$RT_code[split_by[[i]]]))
  }
#}

#split_RT_code()
