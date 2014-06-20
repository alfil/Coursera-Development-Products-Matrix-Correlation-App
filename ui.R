library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Matrix Correlation"),
        sidebarPanel(
                h3('Application Information'),
                helpText('This application will allow to calculate the Correlation Matrix 
                  among the weekly returns of different securities.'),
                helpText('- The securities (stock or ETFs tickers) must be entered in the textbox
                  List of securities (separated by comma).'),
                helpText('- The entered dates will limit the period in which the correlation is 
                  calculated.'),
                helpText('Correlation information can be very useful in stocks portfolio management'),
                helpText('Tickers by default are just an example. They can be replaced by 
                         others (e.g. FB, GOOG, MSFT)'),
                h3('Input Data'),
                textInput('id1', 'List of Securities (separated by comma)', "TLT,SPY,USO"),
                dateInput("from_date", "From date:", "2013-06-01"),
                dateInput("to_date", "To date:", "2014-06-01"),
                submitButton("Submit")
        ),
        mainPanel(
                h3('Correlation'),
                h4('You entered:'),
                verbatimTextOutput("oid1"),
                h4('From date:'),
                verbatimTextOutput("oid2"),
                h4('To date:'),
                verbatimTextOutput("oid3"),
                h4('Correlation Matrix:'),
                plotOutput("otable")
        )
))