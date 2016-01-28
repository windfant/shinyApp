diabetesRisk <- function(glucose) glucose / 200

data <- mtcars

shinyServer(
  
  function(input, output) {
    output$plot1 <- renderPlot({hist(data[,input$attribute1], main=input$attribute1, xlab=input$attribute1, ylab="count")})
    output$plot2 <- renderPlot({hist(data[,input$attribute2], main=input$attribute2, xlab=input$attribute2, ylab="count")})
    
    output$lmPlot <- renderPlot({
      
      input$submitButton
      isolate(plot(data[,input$attribute1] ~ data[,input$attribute2], main=paste(input$attribute1," vs ",input$attribute2), xlab=input$attribute2, ylab=input$attribute1))
    })
  }
)