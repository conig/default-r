install.packages("gitcreds")

if(is.null(unlist(renv::status()$library))){
    renv::init()
}
# Try to restore
try(
  renv::restore(prompt = FALSE),
  silent = TRUE
)
# Install any missing packages
renv::install(prompt = FALSE)
