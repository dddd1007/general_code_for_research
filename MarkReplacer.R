library(stringr)

all_filenames <- dir()
all_filenames <- all_filenames[str_detect(all_filenames, ".log")]
all_filenames <- all_filenames[!str_detect(all_filenames, "_correct_mark.log")]

mark_replacer <- function(logfile) {
  foo <- readLines(logfile)
  result <- foo %>% 
    str_replace("SpaceCon-ColorCon-Red", "SpaceCon-ColorCon") %>% 
    str_replace("SpaceCon-ColorInc-Red", "SpaceCon-ColorInC") %>% 
    str_replace("SpaceInc-ColorCon-Red", "SpaceInC-ColorCon") %>% 
    str_replace("SpaceInC-ColorInC-Red", "SpaceInC-ColorInC") %>% 
    str_replace("SpaceCon-ColorCon-Circle", "SpaceCon-ColorCon") %>% 
    str_replace("SpaceCon-ColorInC-Circle", "SpaceCon-ColorInC") %>% 
    str_replace("SpaceInC-ColorCon-Circle", "SpaceInC-ColorCon") %>% 
    str_replace("SpaceInC-ColorInC-Circle", "SpaceInC-ColorInC") %>% 
    str_replace("SpaceCon-ColorCon-Green", "SpaceCon-ColorCon") %>% 
    str_replace("SpaceCon-ColorInC-Green", "SpaceCon-ColorInC") %>% 
    str_replace("SpaceCon-ColorInC_Green", "SpaceCon-ColorInC") %>% 
    str_replace("SpaceInC-ColorCon_Green", "SpaceInC-ColorCon") %>% 
    str_replace("SpaceInC-ColorCon-Green", "SpaceInC-ColorCon") %>% 
    str_replace("SpaceInC-ColorInC-Green", "SpaceInC-ColorInC") %>% 
    str_replace("SpaceCon-ColorCon-Circle-Green", "SpaceCon-ColorCon") %>% 
    str_replace("SpaceCon-ColorInC-Circle_Green", "SpaceCon-ColorInC") %>% 
    str_replace("SpaceInC-ColorCon-Circle_Green", "SpaceInC-ColorCon") %>%
    str_replace("SpaceInc-ColorCon", "SpaceInC-ColorCon") %>%
    str_replace("SpaceInC-ColorInC-Circle-Green", "SpaceInC-ColorInC") 
  
  new_filenames <- logfile %>% 
    str_replace(".log","_correct_mark.log")
  
  writeLines(result, con = new_filenames)
}

for (i in all_filenames) {
  mark_replacer(i)
}
