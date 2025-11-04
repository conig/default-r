library(targets)
library(tarchetypes)
library(crew)

n_cores <- snipe::n_workers()

tar_option_set(
  packages = c("data.table"),
  controller = crew_controller_local(workers = 6)
)

tar_source()

list(
  tar_target(data_path, "data/default-r", format = "file"),
  tar_target(clean_data, clean_data.fn(data_path))
)
