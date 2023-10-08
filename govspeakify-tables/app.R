library(shiny)
source(file.path("R", "convert.R"))

ui <- fluidPage(
  
  titlePanel("Govspeakify Tables"),
  title = "Govspeakify Tables",
  
  # Explanation
  HTML("<p>This is a minimal proof-of-concept Shinylive app. Find the source <a href='https://github.com/matt-dray/govspeakify-tables'>on GitHub</a>. Read more in <a href='https://www.rostrum.blog/posts/2023-06-21-wordup-tables/'>a related blog post</a>.</p>"),
  
  # Expandable section: demo table
  HTML("<p><details><summary>Click here for an example table to copy.</summary>"),
  tableOutput("example_table"),
  HTML("</details></p>"),
  
  # Area to paste table
  textAreaInput("text_in", NULL, placeholder = "Paste a Word table"),
  
  # Expandable section: Govspeak table style options
  HTML("<p><details><summary>Click here for table options.</summary>"),
  checkboxInput("checkbox_row_titles", "Table has row titles (i.e. the first column contains headers)", value = FALSE, width = "100%"),
  p("Provide the numeric values for rows that contain totals (comma separated):"),
  textInput("text_row_totals", NULL, placeholder = "4"),
  p("Provide a regular expression for characters to ignore when evaluating numeric columns:"),
  textInput("text_regex", NULL, value = ",|%|\\[.\\]"),
  HTML("</details></p>"),
  p(),
  
  # Click button, receive output
  actionButton("button_convert", "Convert to Govspeak", icon("table-cells")), 
  verbatimTextOutput("text_out")
  
)

server <- function(input, output, session) {
  
  # Run conversion function when button is clicked
  govspeakify_reactive <- eventReactive(
    input$button_convert,
    { table_to_govspeak(
      pasted_table   = input$text_in,
      ignore_regex   = input$text_regex,
      has_row_titles = input$checkbox_row_titles,
      totals_rows    = str2num(input$text_row_totals)
    ) }
  )
  
  # Render rows of the table, breaking each onto a separate line
  output$text_out <- renderText({ govspeakify_reactive() }, sep = "\n") 
  
  # Create a demo table that user can copy as an example
  output$example_table <- renderTable(
    data.frame(
      ColA = c("X", "Y", "Z", "Totals"),
      ColB = c(100, 200, 300, 600),
      ColC = c("1,000", "2,000", "3,000", "6,000"),
      ColD = c("1%", "2%", "3%", "6%"),
      ColE = c("15", "[z]", "[c]", "[c]")
    )
  )
  
}

shinyApp(ui = ui, server = server)


