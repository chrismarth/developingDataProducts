library(UsingR)
data(faithful)

shinyServer(function(input, output) {
    confidence <- reactive({(100 - (100 - input$confidence)/2)/100})
    model <- lm(faithful$waiting ~ faithful$eruptions)
    sumCoeff <- summary(model)$coefficients
    slope <- reactive({(sumCoeff[2,1] + c(-1,1)*qt(confidence(),df=model$df) * sumCoeff[2,2])})
    intercept <- reactive({(sumCoeff[1,1] + c(-1,1)*qt(confidence(),df=model$df) * sumCoeff[1,2])})
    nextEruption <- reactive({intercept() + slope()*input$lastEruptDuration - input$lastEruptMinutes})
    output$prediction <- renderText({
      paste(ifelse(nextEruption()[1] <= 0, 0.0, signif(nextEruption()[1],3)), "and", ifelse(nextEruption()[2] <= 0, 0.0, signif(nextEruption()[2],3)), "minutes!")
    })
})
