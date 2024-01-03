Sys.setenv(LANGUAGE = "en")
options(
    bitmapType = "cairo",
    warnPartialMatchArgs = TRUE,
    warnPartialMatchAttr = TRUE,
    warnPartialMatchDollar = TRUE,
    timeout = 999999,
    R_MAX_VSIZE = 2^30
)

# library
using <- function(...) {
    packages <- as.character(match.call(expand.dots = FALSE)[[2]])

    if (length(packages) == 0) {
        return(invisible())
    }
    # Attempt to load packages making note of which don't load
    loaded <- sapply(packages, function(x) {
        # Try to load package
        if (suppressPackageStartupMessages(require(x, character.only = TRUE, quietly = TRUE))) {
            return(TRUE)
        }
        # Couldn't load
        return(FALSE)
    })

    # Give a warning if some packags couldn't be loaded
    if (!all(loaded)) {
        failed <- packages[!loaded]
        warning("\n Failed to load: ", paste(failed, collapse = ", "))
    }
    return(invisible(loaded))
}

# pre-library packages
using(pak, data.table, stringr, tibble, dplyr, tidyr, purrr, magrittr)