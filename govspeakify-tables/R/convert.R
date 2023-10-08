# Function adapted from {wordup}: https://github.com/matt-dray/wordup
table_to_govspeak <- function(
    pasted_table = NULL,
    guess_types = TRUE,
    ignore_regex = ",|%|\\[.\\]",
    has_row_titles = FALSE,
    totals_rows = NULL
) {
  
  if (!is.null(pasted_table)) {
    rows <- strsplit(pasted_table, "\n")[[1]]
  }
  
  cells <- lapply(rows, \(x) trimws(strsplit(x, "\t")[[1]]))
  dat <- do.call("rbind", cells[-1]) |> as.data.frame()
  names(dat) <- cells[[1]]
  
  if (!guess_types) {
    dat <- rbind(rep("-------", length(dat)), dat)
  }
  
  if (guess_types) {
    
    are_cols_num <- lapply(dat, \(x) gsub(ignore_regex, "", x)) |>
      utils::type.convert(as.is = TRUE) |>
      lapply(is.numeric)
    
    for (i in seq_along(are_cols_num)) {
      
      if (are_cols_num[[i]]) {
        are_cols_num[[i]] <- "------:"
      } else {
        are_cols_num[[i]] <- "-------"
      }
      
    }
    
    dat <- rbind(are_cols_num, dat)
    
  }
  
  if (!is.null(totals_rows)) {
    for (row in totals_rows) {
      dat[row + 1, ] <- paste0("**", dat[row + 1, ], "**")
    }
  }
  
  if (has_row_titles) {
    dat[2:nrow(dat), 1] <- paste("#", dat[2:nrow(dat), 1] )
  }
  
  vec <- character(length = nrow(dat) + 1)
  for (row in 1:nrow(dat)) {
    row_pasted <- paste0("| ", paste0(dat[row, ], collapse = " | "), " |")
    vec[row + 1] <- row_pasted
  }
  vec[1] <- paste0("| ", paste0(names(dat), collapse = " | "), " |")
  
  return(vec)
  
}