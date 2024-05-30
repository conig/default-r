status <- renv::status()

lck <- unlist(status$lockfile)

if(!is.null(lck)){
    renv::restore(prompt = FALSE)
    renv::install(prompt = FALSE)
} else{
    install.packages("gitcreds")
    renv::install(prompt = FALSE)
    renv::init()
}