suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny),
  library(tm),
  library(stringr),
  library(markdown),
  library(stylo)))

shinyUI(navbarPage("Coursera Data Science Capstone", 
                   
                   theme = shinytheme("flatly"),
tabPanel("Next Word Prediction",
  # Set the page title

  sidebarPanel(
    textInput("entry",
              h5("Please enter your text here:"),
              "Today, I will"),
    numericInput("n",
                 h5("Numbers of predicted words"),
                 value = 1),
    radioButtons("radio",
                 h5("Decide on the model used:"),
                 choices = list("Simple Model" = 1, "Kneser-Ney " = 2),
                 selected = 1),
    submitButton("Predict")
    ),
  mainPanel(
                        h4("Overview"),
                         p('This application attempts to predict the following word based on frequency of occurrence. Once you have entered desired text, please click "Predict" to view the results.'),
                         h4("Note:"),
                         p("You may choose from two methodologies offered: Simple and Kneser-Ney. The Simple method is quicker but less accurate. The Kneser-Ney is slower but has improved accuracy."),
                         p('Your text as entered'),
                         
                         tags$style(type='text/css', '#sent {background-color: rgba(0,0,255,0.10); color: blue;font-size:25px;}'), 
                         h4(verbatimTextOutput("sent"),style = "color:green"),                               
                         h6('Predicted text'),
                         tags$style(type='text/css', '#text {background-color: rgba(255,255,0,0.10); color: green;font-size:30px;}'),
                         span(h4(verbatimTextOutput('text'),style = "color:green")))),
 tabPanel("About This Application",
                         fluidRow(
                           column(2,
                                  p("")),
                           column(8,
                                  includeMarkdown('About.Rmd')),
                           column(2,
                                  p(""))
                         )
                )

                )
)  
