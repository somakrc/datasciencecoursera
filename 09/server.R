data(mtcars)
# weight <- mtcars$wt
# mpg <- mtcars$mpg
# am <- mtcars$am
# fit0 <- lm(mpg ~ weight * factor(am))
# fitwt <- lm(mpg ~ weight)

shinyServer(
  function(input, output) {
    output$oid1 <- renderText({  
          paste("Scatterplot Showing Regression between Weight and Mileage with",input$id1)
    })
    output$RegModel <- renderPlot(
                      {
                          if(input$id1 == "Automatic Transmission")
                          {
                            weight <- mtcars$wt
                            mpg <- mtcars$mpg
                            am <- mtcars$am
                            fit0 <- lm(mpg ~ weight * factor(am))
                            plot(weight,mpg,main = "Variation of Milage with Weight", xlab = "Weight in 1000 lbs.", ylab = "Milage",col="grey")
                            points(weight[mtcars$am==0],mpg[mtcars$am==0],col="red")
                            abline(coef(fit0)[1], coef(fit0)[2], lwd = 2, col =  "red")
                            abline(h=mean(mpg[mtcars$am==0]),col="red")
                            abline(v= mean(weight[mtcars$am==0]),col="red")
                          }
                          if(input$id1 == "Manual Transmission")
                          {
                            weight <- mtcars$wt
                            mpg <- mtcars$mpg
                            am <- mtcars$am
                            fit0 <- lm(mpg ~ weight * factor(am))
                            plot(weight,mpg,main = "Variation of Milage with Weight", xlab = "Weight in 1000 lbs.", ylab = "Milage",col="grey")
                            points(weight[mtcars$am==1],mpg[mtcars$am==1],col="blue")
                            abline(coef(fit0)[1]+coef(fit0)[3], coef(fit0)[2]+coef(fit0)[4], lwd = 2, col = "blue")
                            abline(h=mean(mpg[mtcars$am==1]),col="blue")
                            abline(v= mean(weight[mtcars$am==1]),col="blue")
                          }
                          if(input$id1 == "Automatic and Manual Transmission")
                          {
                            weight <- mtcars$wt
                            mpg <- mtcars$mpg
                            am <- mtcars$am
                            fit0 <- lm(mpg ~ weight * factor(am))
                            plot(weight,mpg,main = "Variation of Milage with Weight", xlab = "Weight in 1000 lbs.", ylab = "Milage",col="grey")
                            points(weight[mtcars$am==0],mpg[mtcars$am==0],col="red")
                            points(weight[mtcars$am==1],mpg[mtcars$am==1],col="blue")
                            abline(lm(mpg ~ weight), lwd = 2, col = "black")
                            abline(coef(fit0)[1], coef(fit0)[2], lwd = 2, col =  "red")
                            abline(coef(fit0)[1]+coef(fit0)[3], coef(fit0)[2]+coef(fit0)[4], lwd = 2, col = "blue")
                            abline(h=mean(mpg[mtcars$am==0]),col="red")
                            abline(v= mean(weight[mtcars$am==0]),col="red")
                            abline(h=mean(mpg[mtcars$am==1]),col="blue")
                            abline(v= mean(weight[mtcars$am==1]),col="blue")
                            legend("topright",legend=c(" mpg ~ wt Overall", " mpg ~ wt with Auto ", " mpg ~ wt with Manual "),lty=c(1,1,1),col=c("black","red","blue"))
                          }
                      }   
                  )
        
  }
)
