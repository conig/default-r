install.packages("gitcreds")

if(is.null(unlist(renv::status()$library))){
    renv::init()
}
# Try to restore
try(
  renv::restore(prompt = FALSE),
  silent = TRUE
)
# Get packages in lockfile
lockfile_pkgs <- sapply(renv::status()$lockfile$Packages,
  function(x) x$Package)
  
# Install any missing packages
renv::install(prompt = FALSE,
              lock = FALSE,
              exclude = lockfile_pkgs)
