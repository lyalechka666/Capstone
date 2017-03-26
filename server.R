suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny),
  library(tm),
  library(stringr),
  library(markdown),
  library(stylo)))

source("Word_Predictor.R")

       profanity <- load('profanity.rds')
       attach('ngram.RData')
       shinyServer(function(input, output) {
       dataInput <- reactive({
       progress <- shiny::Progress$new()
       on.exit(progress$close())
       
       progress$set(message = "predicting", value = 3)
       if(input$radio == 1){
       predict0(input$entry,profanity,unigramDF,bigramDF,trigramDF,maxResults = input$n)
       }else{
       predictKN(input$entry,profanity,unigramDF,bigramDF,trigramDF,maxResults = input$n)
       }
       })
       output$text <- renderText({
       dataInput()
       })
       output$sent <- renderText({
       input$entry
       })
       })
