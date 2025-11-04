library(targets)
library(tarchetypes)
library(crew)

n_cores <- snipe::n_workers()
data_dir <- Sys.getenv("data_dir")

tar_option_set(
  packages = c("data.table"),
  controller = crew_controller_local(workers = n_cores)
)

tar_source("R")
tar_source("_target_pipelines")

c(
  path_targets,
  data_cleaning_targets,
  analysis_targets,
  report_targets
)
