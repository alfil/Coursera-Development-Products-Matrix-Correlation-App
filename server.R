library(shiny)

## Function that will calculate the correlation among the different entered securities
corr_calculation <- function(str_secs){
        ## Libraries
        library(stockPortfolio)
        library(corrplot)
        
        ## Color Scheme
        ealred <- "#7D110C"
        ealtan <- "#CDC4B6"
        eallighttan <- "#F7F6F0"
        ealdark <- "#423C30"
        
        ## Data handling
        tmp <- unlist(strsplit(str_secs, split=","))
        v_secs <- gsub("(^ +)|( +$)", "", tmp)
        
        ## We get the returns
        returns <- getReturns(v_secs, freq="week")
        
        ## Create the correlation table
        cov <- cov(returns$R, method="kendall")
        corr <- cov2cor(cov)
        
        ## Create color palette
        col1 <- colorRampPalette(c(ealtan,ealred))
        
        ## Plot
        corrplot(corr, method="shade", title="Correlation Matrix", bg=eallighttan, 
                addCoef.col="white", addCoefasPercent=FALSE, tl.col=ealdark, 
                tl.srt=45, col=col1(4), mar = c(0,1,2,2), tl.offset=.2, tl.cex=1, 
                type="upper")    
}


## Render result
shinyServer(
        function(input,output){
                output$oid1 <- renderPrint({input$id1})
                output$oid2 <- renderPrint({input$from_date})
                output$oid3 <- renderPrint({input$to_date})
                output$otable <- renderPlot({
                        corr_calculation(input$id1)
                })
                
        }
)