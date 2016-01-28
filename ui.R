shinyUI(

  pageWithSidebar(
    headerPanel("Motor Trend Car Road Tests"),
    sidebarPanel(
      selectInput(inputId='attribute1', label='Attribute 1', choices=colnames(mtcars), selected="mpg"),
      selectInput(inputId='attribute2', label='Attribute 2', choices=colnames(mtcars), selected="mpg"),
      actionButton('submitButton', 'Submit'),
      br(),
      br(),
      plotOutput('plot1', height="300px"),
      br(),
      br(),
      plotOutput('plot2', height="300px")
    ),
    
    mainPanel(
      textOutput('Relationship between  and Attribute 2'),
      plotOutput('lmPlot')
    )
  )
)
