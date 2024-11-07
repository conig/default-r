options(install.opts = "--no-lock")

# Initialize renv if the library is empty
if (is.null(unlist(renv::status()$library))) {
    renv::init(bare = TRUE)
}

# Try to restore the environment from the lockfile
tryCatch(
  {
    renv::restore(prompt = FALSE)
  },
  error = function(e) {
    message("Error during renv::restore: ", e$message)
  }
)
# Get renv status including dev packages
renv_status <- renv::status(dev=TRUE)

# Check if all packages in the lockfile are installed
lockfile_pkgs <- names(renv_status$lockfile$Packages)
installed_pkgs <- names(renv_status$library$Packages)

missing_pkgs <- setdiff(lockfile_pkgs, installed_pkgs)

# Install any missing development packages
if (length(missing_pkgs) > 0) {
  message("Installing missing packages: ", paste(missing_pkgs, collapse = ", "))
  renv::install(packages = missing_pkgs, prompt = FALSE, lock = FALSE)
} else {
  message("All packages from the lockfile are already installed.")
}

# Additional check to ensure all packages are installed
installed_pkgs <- names(renv::status(dev=TRUE)$library$Packages)
still_missing_pkgs <- setdiff(lockfile_pkgs, installed_pkgs)

if (length(still_missing_pkgs) > 0) {
  message("Some packages are still missing: ", paste(still_missing_pkgs, collapse = ", "))
} else {
  message("All packages from the lockfile are successfully installed.")
}
