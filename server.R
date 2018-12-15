#
# This is the server logic of a Shiny web application. You can run the 

library(shiny)
library(ggplot2)
#Load Data
population<-read.csv("census_new_zealand.csv")
#save(population, file="census_new_zealand.Rdata")
load("census_new_zealand.Rdata")

# Define server logic required to draw the ggplot
shinyServer(function(input, output) {

  output$gender<-renderText(input$gender) 
  
  output$distPlot <- renderPlot({
    
    #plot data based on criteria
      options(shiny.sanitize.errors = FALSE)
      population<-as.data.frame(population)
      #Filter data based on user input
      population<-population[population$Gender == input$gender & population$Year >= input$year,]
    if (input$gender == "Male") { x = "Blue" } else { x = "deepPink2" }
      print(col)
    #ggplot(data=population)+geom_point(aes(x=Year, y=Population), colour=x ,size=4,  data=filter(population, population$Gender == input$gender & population$Year >= input$year))
    ggplot(data=population)+geom_point(aes(x=Year, y=Population), colour=x ,size=4)
    
        })
  
})
