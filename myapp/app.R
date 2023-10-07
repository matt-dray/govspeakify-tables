library(shiny)
library(wordup)

ui <- fluidPage(
  p("This is a proof of concept"),
  textAreaInput(inputId = "text_in", label = NULL, placeholder = "Paste a table"), 
  actionButton(inputId = "button_convert", label = "Convert", icon = icon("table-cells")), 
  verbatimTextOutput(outputId = "text_out", placeholder = TRUE),
)

server <- function(input, output, session) {
  
  govspeakify_reactive <- eventReactive(
    input$button_convert,
    {table_to_govspeak(
      word_table = input$text_in,
      to_clipboard = FALSE
    )}
  )
  
  output$text_out <- renderText({
    govspeakify_reactive()
  }) 
  
}

shinyApp(ui = ui, server = server)
