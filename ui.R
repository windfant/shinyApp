shinyUI(

  pageWithSidebar(
    headerPanel("Motor Trend Car Road Tests"),
    sidebarPanel(
      selectInput(inputId='var1', label='Variable 1', choices=colnames(mtcars), selected="mpg"),
      selectInput(inputId='var2', label='Variable 2', choices=colnames(mtcars), selected="mpg"),
      actionButton('submitButton', 'Submit')
    ),
    
    mainPanel(
      
      
      h3('Variable Description'),
      textOutput('var1Desc'),
      textOutput('var2Desc'),
      br(),
      
      h3('Data Distribution'),
      splitLayout(cellWidths=300,
                  plotOutput('plot1', height="300px"),
                  plotOutput('plot2', height="300px")
      ),
      
      h3('Relationship between variables'),
      plotOutput('lmPlot')
    )
  )
)
