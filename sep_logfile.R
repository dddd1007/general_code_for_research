library(stringr)

# input_vector must contain the numbers of trials in all blocks
input_vector <- c(32, 213, 214, 213, 213, 214, 213)
block_names <- c("block1", "block2", "block3", "block4", "block5", "block6")

sep_log_file <- function(filename, input_vector, block_names) {
  temp_file <- readLines(filename)
  
  # locate the two tables
  loc_table_trials <- str_detect(temp_file, "Trial")
  loc_table_trials <- c(1:length(loc_table_trials))[loc_table_trials]
  
  loc_table_RT <- str_detect(temp_file, "RT")
  loc_table_RT <- c(1:length(loc_table_RT))[loc_table_RT]
  
  loc_intro <- which(str_detect(temp_file, "intro_message")*1 == 1)
  loc_end_practice <- which(str_detect(temp_file, "end_practice")*1 == 1)
  loc_break <- which(str_detect(temp_file, "break")*1 == 1)
  loc_end_exp <- which(str_detect(temp_file,"end_message")*1 == 1)
  if (length(loc_break) < 12) {
    loc_break <- sort(c(loc_break, loc_end_exp))
  }
  loc_block <- sort(c(loc_end_practice, loc_break))

  for (i in 1:length(block_names)) {
    new_filename <- filename %>% 
      str_replace(".log", paste0("_", block_names[i], ".log"))
    
    trials_starter <- loc_block[i]
    trials_end <- loc_block[i+1]
    RT_start <- loc_block[i + length(block_names) + 1]
    RT_end <- loc_block[i + length(block_names) + 2]
    writing_text <- c(temp_file[1:3], 
                      temp_file[loc_table_trials], "",
                      temp_file[trials_starter:trials_end],"",
                      temp_file[loc_table_RT], "", "",
                      temp_file[RT_start:RT_end])
    writeLines(text = writing_text, con = new_filename)
  }
}

#setwd("/Users/eXrld/Dropbox/PhD_work/Behavior_Experiment/LearnPC_Behavior_Analysis/Data/color_first_2575_2575/")
all_filenames <- dir()
need_filenames <- all_filenames[str_detect(all_filenames, "correct_mark.log")]

for (i in need_filenames) {
  sep_log_file(i, input_vector, block_names)
}
