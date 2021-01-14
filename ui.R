

ui <- fluidPage(
  
  navbarPage("Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between body mass indices and medical charges"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable1", "Analyse by region", choices = c("northeast", "northwest", "southeast", "southwest")),
                            selectInput( "variable2", "Select the smoker status", choices = c("yes", "no") ),
                            sliderInput("bmipred", "Select bmi for prediction",
                                        min = 10, max = 50, value = 25),
                            
                          ), 
                          
                          mainPanel(
                            #h3(textOutput("caption")),
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Regression model", 
                                                 plotOutput("Plot"),
                                                 verbatimTextOutput("predictedvalue"),
                                                 verbatimTextOutput("summary")
                                        )
                            )
                          )
                        ))),
             
             tabPanel("About the Data Set",
                      
                      h3("Insurance data set"),
                      p("This dataset is taking from"),
                      a("https://www.kaggle.com/mirichoi0218/insurance"),
                      
                      p("It has 1338 observations for 7 variables."),
                      h3("Format"),
                      
                      p("This dataset has 1338 observations for 7 variables."),
                      
                      p("  [, 1]   age: age of primary beneficiary",
                        p("  [, 2]	  sex: insurance contractor gender, female, male"),
                        p("  [, 3]	  bmi: Body mass index, providing an understanding of body, weights that are relatively high or low relative to height,",
                          "objective index of body weight (kg / m ^ 2) using the ratio of height to weight,ideally 18.5 to 24.9"),
                        p("  [, 4]	  children: Number of children covered by health insurance / Number of dependents"),
                        p("  [, 5]	  smoker: Smoking"),
                        p("  [, 6]	  region: the beneficiary's residential area in the US, northeast, southeast, southwest, northwest.)"),
                        p("  [, 7]	  charges: Individual medical costs billed by health insurance"),
                        
                        
                      ),
             ),
             
             tabPanel("Documentation",
                      h2("How to use this shiny application"),
                      hr(),
                      p("Firstly, you need to select the region in which you want to conduct the analysis by choosing it from the dropdown menu."),
                      p("Secondly, you need to select the smoker status from the dropdown menu in the smoker status textbox."),
                      p("After selecting the region and the smoker status, you will have display the plot and the summary of the corresponding fitted model."),
                      p("From the radio button select bmi for prediction, slide the button to your choosing bmi and you will have display the predicted charges for it. "),
                      
             ),
             tabPanel("Go back to my Github repository",  
                   
                      a("https://github.com/AnalystJanine1/Shiny-App"), 
             )
  )
)


