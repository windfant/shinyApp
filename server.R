diabetesRisk <- function(glucose) glucose / 200

data <- mtcars

desc <- c("Miles/(US) gallon", "Number of cylinders", "Displacement (cu.in.)", "Gross horsepower", "Rear axle ratio", "Weight (lb/1000)",	"1/4 mile time", "V/S", "Transmission (0 = automatic, 1 = manual)","Number of forward gears", "Number of carburetors")

description <- data.frame(names(data), desc)
names(description)[1] <- "var"

shinyServer(
  
  function(input, output) {
    output$plot1 <- renderPlot({hist(data[,input$var1], main="Variable 1", xlab=input$var1, ylab="count")})
    output$plot2 <- renderPlot({hist(data[,input$var2], main="Variable 2", xlab=input$var2, ylab="count")})
    output$var1Desc <- renderText({paste(input$var1, ":" , description[description$var == input$var1, "desc"])})
    output$var2Desc <- renderText({paste(input$var2, ":" , description[description$var == input$var2, "desc"])})
    
    output$lmPlot <- renderPlot({
      
      input$submitButton
      isolate(plot(data[,input$var1] ~ data[,input$var2], main=paste(input$var1," vs ",input$var2), xlab=input$var2, ylab=input$var1))
    })
  }
)