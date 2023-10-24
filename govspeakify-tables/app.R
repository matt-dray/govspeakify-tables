library(shiny)
library(rclipboard)
source(file.path("R", "convert.R"))

ui <- fluidPage(
  
  titlePanel("Govspeakify Tables"),
  title = "Govspeakify Tables",
  
  # Insert clipboard.js into header
  rclipboardSetup(),
  
  # CSS to ensure that triangle appears to indicate expandable details-block
  tags$style(
    "summary {
       display: list-item
    }"
  ),
  
  # Explanation
  HTML("Convert a pasted Word table to <a href='https://govspeak-preview.publishing.service.gov.uk/guide'>Govspeak Markdown</a>."),
  p(),
  HTML("This is a minimal proof-of-concept <a href='https://github.com/posit-dev/shinylive'>Shinylive</a> app. Find the source <a href='https://github.com/matt-dray/govspeakify-tables'>on GitHub</a>. Read more in <a href='https://www.rostrum.blog/posts/2023-10-08-govspeakify-tables/'>a related blog post</a>.</p>"),
  
  # Expandable section: demo table
  HTML("<p><details><summary>Click here for an example table to copy.</summary>"),
  tableOutput("example_table"),
  HTML("</details></p>"),
  
  # Area to paste table
  textAreaInput("text_in", NULL, placeholder = "Paste a Word table"),
  
  # Expandable section: Govspeak table style options
  HTML("<p><details><summary>Click here to change the table options.</summary>"),
  checkboxInput("checkbox_row_titles", "Table has row titles (i.e. the first column is a header column)", value = FALSE, width = "100%"),
  p("Provide (comma-separated) numeric values for rows that contain totals:"),
  textInput("text_row_totals", NULL, placeholder = "e.g. 4"),
  p("Provide a regular expression for characters to ignore when evaluating numeric columns:"),
  textInput("text_regex", NULL, value = ",|%|\\[.\\]"),
  HTML("</details></p>"),
  p(),
  
  # Click button, receive output
  actionButton("button_convert", "Convert to Govspeak", icon("table")), 
  verbatimTextOutput("text_out"),
  uiOutput("button_clip")
  
)

server <- function(input, output, session) {
  
  # Create a demo table that user can copy as an example
  output$example_table <- renderTable(
    data.frame(
      ColA = c("X", "Y", "Z", "Totals"),
      ColB = c(100L, 200L, 300L, 600L),
      ColC = c("1,000", "2,000", "3,000", "6,000"),
      ColD = c("1%", "2%", "3%", "6%"),
      ColE = c("15", "[z]", "[c]", "[c]")
    )
  )
  
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
  
  # Copy button to be rendered only after the 'convert' button has been clicked
  rclipButton_reactive <- eventReactive(
    input$button_convert,
    { rclipButton(
      inputId = "clipbtn", 
      label = "Copy", 
      clipText = { paste(
        table_to_govspeak(
          pasted_table   = input$text_in,
          ignore_regex   = input$text_regex,
          has_row_titles = input$checkbox_row_titles,
          totals_rows    = str2num(input$text_row_totals)
        ), 
        collapse = "\n"
      ) }, 
      icon = icon("copy")
    ) }
  )
  
  # Generate the 'copy' button
  output$button_clip <- renderUI({ rclipButton_reactive() }) 
  
}

shinyApp(ui = ui, server = server)
