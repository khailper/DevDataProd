library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Retirement Savings Recommendation"),
        sidebarPanel(
                h1("Income Information"),
                numericInput("income", "What's your normal weekly income?", 0, min = 0, step = 10),
                radioButtons("match", "Does your employer offer a 401(k) or other match for retirement savings?", c("Yes" = "Yes","No" = "No"), "No")
        ),
        mainPanel(
                h3("Your Recommended Weekly Retirement Savings:"),
                verbatimTextOutput("recommendation"),
                h3("Disclosure:"),  
                p("This is just a rough estimate of what you may wish to save for a comfortable retirement and not formal financial advice.  The correct amount for you will vary based on a variety of factors not captured here.")
        )
))