shinyUI(fluidPage(  
  titlePanel("When Will Old Faithful Erupt Next!"),
  fluidRow(
    column(12,
           h3("Old Faithful will erupt within..."),
           h3(textOutput('prediction'))
    )
  ),
  fluidRow(
    column(12,
      wellPanel(
        sliderInput('lastEruptMinutes', 'How many minutes ago did Old Faithful erupt?',value = 35, min = 0, max = 100, step = 1.0),
        sliderInput('lastEruptDuration', 'How many minutes did the last eruption last?', value = 3.5, min = 1, max = 6, step = 0.25), 
        sliderInput('confidence', 'What % Confidence?', value = 95, min = 90, max = 99, step = 1.0) 
      )
    )
  )
))