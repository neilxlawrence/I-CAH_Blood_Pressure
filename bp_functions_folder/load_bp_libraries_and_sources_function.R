load_bp_libraries_and_sources_function <- 
  function(
    location_of_functions_folder="C:/Users/User/Documents/NRL_R_work/iCAH_Blood_pressure/",
    location_of_data_files="C:/Users/User/Documents/NRL_R_work/iCAH_Blood_pressure/bp_data_files_to_load/",
    statement_to_print="Functions and themes loaded, and folder data_files_to_load is ready in the parent directory. The source of the functions was:"){

      print(statement_to_print)
  
    print(location_of_functions_folder)
    #first we create a list of dataframes that we save, if they exist, after each file to be able to split the code up   
    #add a frame to this list to ensure it is both saved after a file if it exists, and loaded at the beginning of a file if it exists

    list_of_data_frames_to_save <- 
  as.list(c(
      "imputed_data_set",
      "bp_participants",
      "bp_labs_to_widen",
      "bp_labs_to_widen_with_units",
      "converted_17OHP_to_join",
      "converted_androstenedione_to_join",
      "converted_renin_to_join",
      "converted_plasma_renin_activity_to_join",
      "converted_combined_renin_to_join",
      "bp_participants_longitudinal_data",
      "bp_participants_base_data",
      "bp_labs_wide",
      "bp_meds_wide",
      "prednisolone_to_hydrocortisone_conversion",
      "dexamethasone_to_hydrocortisone_conversion",
      "cortisone_acetate_to_hydrocortisone_conversion",
      "methylprednisolone_to_hydrocortisone_conversion",
      "bp_fludro_wide",
      "bp_data",
      "bp_martin_joined_to_model",
      "number_of_imputations",
      "lower_level_of_detection_17ohp_nmol_l",
      "lower_level_of_detection_androstenedione_nmol_l",
      "lower_level_of_detection_renin_µIU_ml",
      "upper_level_of_detection_17ohp_nmol_l",
      "upper_level_of_detection_androstenedione_nmol_l",
      "upper_level_of_detection_renin_µIU_ml",
      "martin_extraction_decimal_age_to_join", 
      "bp_data_under_twenty",
      "bp_data_under_twenty_male",
      "bp_data_under_twenty_fema",
      "bp_data_under_twenty_not_assigned",
      "male_lms_height_centiles",
      "fema_lms_height_centiles",
      "male_lms_weight_centiles",
      "fema_lms_weight_centiles",
      "male_lms_systolic_centiles",
      "fema_lms_systolic_centiles",
      "male_lms_diastolic_centiles",
      "fema_lms_diastolic_centiles",
      "median_centile_systolic_male_differences",
      "median_centile_systolic_fema_differences",
      "median_centile_diastolic_male_differences",
      "median_centile_diastolic_fema_differences",
      "male_lms_systolic_centiles_imputed_combined",
      "male_lms_diastolic_centiles_imputed_combined",
      "fema_lms_systolic_centiles_imputed_combined",
      "fema_lms_diastolic_centiles_imputed_combined",
      "male_systolic_changepoint_model_fit",
      "male_diastolic_changepoint_model_fit",
      "fema_systolic_changepoint_model_fit",
      "fema_diastolic_changepoint_model_fit",
      "all_imputed_estimates_model_a",
      "all_r2_systolic_model_a",
      "all_r2_diastolic_model_a",
      "all_predictions_systolic_model_a",
      "all_predictions_diastolic_model_a",
      "bp_data_one_to_twenty",
      "bp_data_under_five",
      "bp_data_one_to_five",
      "id_bootstrap_list_under_twenty",
      "id_bootstrap_list_under_five",
      "id_bootstrap_list_one_to_twenty",
      "id_bootstrap_list_one_to_five",
      "number_of_bootstraps"
      ))

#assign the list to the global environment
    assign(x="list_of_data_frames_to_save", 
           value=list_of_data_frames_to_save, 
           env=.GlobalEnv)

#create a file where files can be saved and reloaded        
dir.create("bp_data_files_to_load")

#save the list outside of R 
    save(x=list_of_data_frames_to_save, 
         file = paste0(location_of_data_files, "list_of_data_frames_to_save.Rdata"), 
         compress=F)    

suppressWarnings({
  if(!require(rlang)){install.packages("rlang")}
  library(rlang)
  if(!require(piecewiseSEM)){install.packages("piecewiseSEM")}
  library(piecewiseSEM)
  if(!require(nlme)){install.packages("nlme")}
  library(nlme)
  if(!require(readxl)){install.packages("readxl")}
  library(readxl)
  if(!require(dplyr)){install.packages("dplyr")}
  library(dplyr)
  if(!require(mixtools)){install.packages("mixtools")}
  library(mixtools)
  if(!require(emmeans)){install.packages("emmeans")}
  library(emmeans)
  if(!require(readr)){install.packages("readr")}
  library(readr)
  if(!require(tidyverse)){install.packages("tidyverse")}
  library(tidyverse)
  if(!require(data.table)){install.packages("data.table")}
  library(data.table)
  if(!require(lubridate)){install.packages("lubridate")}
  library(lubridate)
  if(!require(ggplot2)){install.packages("ggplot2")}
  library(ggplot2)
  if(!require(ggpubr)){install.packages("ggpubr")}
  library(ggpubr)
  if(!require(rstatix)){install.packages("rstatix")}
  library(rstatix)
  if(!require(multcompView)){install.packages("multcompView")}
  library(multcompView)
  if(!require(knitr)){install.packages("knitr")}
  library(knitr)
  if(!require(DT)){install.packages("DT")}
  library(DT)
  if(!require(extrafont)){install.packages("extrafont")}
  library(extrafont)
  if(!require(easycsv)){install.packages("easycsv")}
  library(easycsv)
  if(!require(PairedData)){install.packages("PairedData")}
  library(PairedData)
  if(!require(compare)){install.packages("compare")}
  library(compare)
  if(!require(pastecs)){install.packages("pastecs")}
  library(pastecs)
  if(!require(pwr)){install.packages("pwr")}
  library(pwr)
  if(!require(gdata)){install.packages("gdata")}
  library(gdata)
  if(!require(skimr)){install.packages("skimr")}
  library(skimr)
  if(!require(summarytools)){install.packages("summarytools")}
  library(summarytools)
  if(!require(GGally)){install.packages("GGally")}
  library(GGally)
  if(!require(BSDA)){install.packages("BSDA")}
  library(BSDA)
  if(!requireNamespace("BiocManager", quietly = TRUE))
    if(!require(BiocManager)){install.packages("BiocManager")}
  if(!require(ggforce)){install.packages("ggforce")}
  library(ggforce)
  if(!require(svglite)){install.packages("svglite")}
  library(svglite)
  if(!require(devtools)) install.packages("devtools")
  if(!require(factoextra)){install.packages("factoextra")}
  library(factoextra)
  if(!require(mice)){install.packages("mice")}
  library(mice)
  if(!require(miceadds)){install.packages("miceadds")}
  library(miceadds)
  if(!require(micemd)){install.packages("micemd")}
  library(micemd)
  if(!require(ggmice)){install.packages("ggmice")}
  library(ggmice)
  if(!require(missForest)){install.packages("missForest")}
  library(missForest)
  if(!require(Hmisc)){install.packages("Hmisc")}
  library(Hmisc)
  if(!require(kableExtra)){install.packages("kableExtra")}
  library(kableExtra)
  if(!require(gt)){install.packages("gt")}
  library(gt)
  if(!require(glue)){install.packages("glue")}
  library(glue)
  if(!require(lmerTest)){install.packages("lmerTest")}
  library(lmerTest)# to get p-value estimations that are not part of the standard lme4 packages
  if(!require(effects)){install.packages("effects")}
  library(effects)
  if(!require(multilevelTools)){install.packages("multilevelTools")}
  library(multilevelTools)
  if(!require(RColorBrewer)){install.packages("RColorBrewer")}
  library(RColorBrewer)
  #note that gamlss masks functions from mfp and from lmer, so need to be careful
  if(!require(gamlss)){install.packages("gamlss")}
  library(gamlss)
  if(!require(lme4)){install.packages("lme4")}
  library(lme4)
  if(!require(mfp)){install.packages("mfp")}
  library(mfp)
  if(!require(glmnet)){install.packages("glmnet")}
  library(glmnet)
  if(!require(shrink)){install.packages("shrink_1.2.1.tar.gz", repos=NULL, type="source")}
  library(shrink)
  if(!require(slm)){install.packages("slm")}
  library(slm)
  if(!require(cowplot)){install.packages("cowplot")}
  library(cowplot)
  if(!require(lqmm)){install.packages("lqmm")}
  library(lqmm)
  if(!require(gridExtra)){install.packages("gridExtra")}
  library(gridExtra)
  if(!require(mice)){install.packages("mice")}
  library(mice)
  if(!require(tidyr)){install.packages("tidyr")}
  library(tidyr)
  if(!require(tibble)){install.packages("tibble")}
  library(tibble)
  if(!require(summarytools)){install.packages("summarytools")}
  library(summarytools)
  if(!require(childsds)){install.packages("childsds")}
  library(childsds)
  if(!require(pedbp)){install.packages("pedbp")}
  library(pedbp)
  if(!require(brms)){install.packages("brms")}
  library(brms)
  source(paste0(location_of_functions_folder, "icah_bp_plot_themes.R"))
  source(paste0(location_of_functions_folder, "save_bp_files_function.R"))
  source(paste0(location_of_functions_folder, "load_bp_files_function.R"))
  
  
  
})
}
