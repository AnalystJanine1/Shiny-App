
library(shiny)

data <- read.csv("insurance.csv")

shinyServer(function(input, output) {
  
  mydatamodels  <- reactive({
    
    data1 <- data[(data$region == paste(input$variable1) & data$smoker == paste(input$variable2)), ]
    
    model3 <- lm(charges ~ bmi, data1)
    
    list(data1=data1, model3=model3)
  })
  
  predictedcharge <- reactive({
    modelcoef  <- coef(mydatamodels()$model3)
    modelcoef[1] + modelcoef[2]*input$bmipred
  })
  
  formulaText1 <- reactive({
    
    model3 <- mydatamodels()$model3
    
    data1 <- mydatamodels()$data1
    
    plot1 <- plot(data1$bmi, data1$charges,
                  main = "Scatterplot of bmi vs. medical charges by thousand",
                  pch=16,
                  cex = 1.3, col = "green",
                  xlab='bmi',
                  ylab='charges') 
    abline(model3, col='blue')
  })
  
  output$predictedvalue <- renderPrint({
    cat( "The predicted charges for a bmi of ", input$bmipred, "is:",  round(predictedcharge(), digits=2), "dollars.")
  })
  
  formulaText2 <- reactive({
    print(summary(mydatamodels()$model3))
  }) 
  
  output$Plot <- renderPlot({
    formulaText1()
  })
  
  output$summary <- renderPrint({
    formulaText2()
  })
  
}
)

