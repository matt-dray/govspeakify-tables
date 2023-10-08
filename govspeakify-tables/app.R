library(shiny)
source(file.path("R", "convert.R"))

ui <- fluidPage(
  titlePanel("Govspeakify Tables"),
  HTML("<p>This is a minimal proof-of-concept Shinylive app. Find the source <a href='https://github.com/matt-dray/govspeakify-tables'>on GitHub</a>. Read more in <a href='https://www.rostrum.blog/posts/2023-06-21-wordup-tables/'>a related blog post</a>.</p>"),
  HTML("<p><details><summary>Click here for an example table to copy.</summary><table><tr><td>Column 1</td><td>Column 2</td><td>Column 3</td><td>Column 4</td><td>Column 5</td></tr><tr><td>X</td><td>100</td><td>1,000</td><td>1%</td><td>15</td></tr><tr><td>Y</td><td>200</td><td>2,000</td><td>2%</td><td>12</td></tr><tr><td>Z</td><td>300</td><td>3,000</td><td>3%</td><td>[c]</td></tr><tr><td>Totals</td><td>600</td><td>6,000</td><td>6%</td><td>[c]</td></tr></table></details></p>"),
  p(),
  textAreaInput("text_in", NULL, placeholder = "Paste a Word table"), 
  actionButton("button_convert", "Convert to Govspeak", icon("table-cells")), 
  verbatimTextOutput("text_out")
)

server <- function(input, output, session) {
  
  govspeakify_reactive <- eventReactive(
    input$button_convert,
    { table_to_govspeak(input$text_in) }
  )
  
  output$text_out <- renderText({ govspeakify_reactive() }, sep = "\n") 
  
}

shinyApp(ui = ui, server = server)


