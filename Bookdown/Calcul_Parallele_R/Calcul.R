# Installer bookdown si nécessaire
install.packages("bookdown")

# Générer le livre en HTML
bookdown::render_book("Page_de_garde.Rmd", "bookdown::gitbook")

