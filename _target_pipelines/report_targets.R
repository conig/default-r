report_targets <- list(
  tarchetypes::tar_render(
    manuscript,
    "src/markdown/manuscript.Rmd",
    output_dir = "outputs",
    output_format = c("papaja::apa6_pdf", "papaja::apa6_docx")
  )
)
