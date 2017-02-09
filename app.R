library(shiny)

#ui.R
ui <- fluidPage(
  sliderInput(inputId = "num", label = "No. of points", value = 25, min = 1, max = 200),
  plotOutput("hist")
  )

#server.R
server <- function(input,output) {
      output$hist = renderPlot({
        if(input$num>100)
          {
            title = "Hintogram of 100 normal point"
            hist(rnorm(input$num),main = title)
          }
        else
          {
            title = "Scatter plot"
            plot(rnorm(input$num),main = title)
      }
  })
}

shinyApp(ui = ui, server = server)