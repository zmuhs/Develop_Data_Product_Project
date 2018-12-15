#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
#Load Data
#setwd("C://data_science/09_data_product")
#population<-read.csv("census_new_zealand.csv")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("New Zealand Population Growth by Gender Since 1971 "),
  
  # Sidebar with a slider input for selecting the gender and the years selection
  sidebarLayout(
    sidebarPanel(
       h5("New Zealand Census data captured once every 5 years, a subset data been downloaded from http://archive.stats.govt.nz/Census official website."),
       h5("Note that the data for 2018 is not published yet, and the last census data avilable is for the year 2013."),
       h5("This shiny program is: "),
       h5("1. Dynamic and allows plotting population by gender."),
       h5("2. Allows user to choose the startup year for plotting."),
       radioButtons("gender", "Select the Gender", list("Male","Female"), selected = "Male"),
       selectInput("year","Select the starting year for the plot", c("1971","1976","1981","1986","1991","1996","2001","2006","2013"), selected = "1971"),
       submitButton("Refresh")
       
    ),
    
               
    # Show a plot of the generated distribution
 
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
