#' 本代码旨在改正 Xia 在编写 Presentation 代码时所出现的代码中，判断
#' 是否选择符合正确按键的代码段出现问题的情况。
#' 原代码中，由于出现 "practice_array[i] <= 12" (line 250) 的逻辑错误，
#' 使得 SpaceInC-ColorInC-Green 的正确反应为2并未得到正确匹配。
#' 本脚本的目的在于修正第一批数据中的该错误。
#' 
#' 
change_the_correction_rate <- function(logfile) {
  library(magrittr)
  library(stringr)
  foo <- readLines(logfile) %>% 
    str_replace("SpaceInC-ColorInC-Green\tincorrect\t2","SpaceInC-ColorInC-Green\thit\t2")
  
  writeLines(foo, logfile)
}

all_logfiles <- dir(pattern = "log")

