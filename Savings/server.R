library(shiny)
lowersave <- function(income, match){
        if (match == "No"){
                income * .1
        }
        else{
                income * .05
        }
}

uppersave <- function(income, match){
        if (match == "No"){
                income * .2
        }
        else{
                income * .1
        }
}

advice <- function(income, match){
        paste("$", lowersave(income, match), " to $", uppersave(income, match), collapse = "")
}

shinyServer(
        function(input, output){
             output$recommendation <- renderPrint({advice(input$income, input$match)})   
        }
)