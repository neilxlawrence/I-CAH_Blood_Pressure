#this file creates the function of the data frames to save after each file if they exist

save_bp_files_function <- 
  function(parent_directory="./bp_data_files_to_load/",
           parent_file_name,
           file_save_message="files successfully saved"){
    
    #note the list of data frames to save and to load is listed in the load_bp_libraries_and_sources_function file   
    load(paste0(parent_directory, 
                "list_of_data_frames_to_save", 
                ".Rdata"))
    
    for (i in 1:length(list_of_data_frames_to_save)){  
      
      name_of_data_frame_to_save <- 
        list_of_data_frames_to_save[[i]]
      
      if(exists(name_of_data_frame_to_save)){
        data_frame_to_save <- 
          get(eval(list_of_data_frames_to_save[[i]]))
        #don't write it as csv also for sake of memory wastage
        #    write.csv(x=data_frame_to_save, 
        #              file=paste0("./bpdatafilestoload/", 
        #                          name_of_data_frame_to_save, 
        #                          "_after_", 
        #                          parent_file_name, ".csv"),
        #              row.names = FALSE)
        save(x=data_frame_to_save, 
             file = paste0(parent_directory, 
                           name_of_data_frame_to_save, 
                           "_after_", parent_file_name, 
                           ".Rdata"), 
             compress=F)
        print(paste0("Saved: ", name_of_data_frame_to_save))
      }
    }
  }
