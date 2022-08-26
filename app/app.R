library(shiny)
library(shinythemes)
library(e1071)

# Read dataset with car qualities to learn from.
cars = read.csv("../data/raw/car.data", sep = ",")

# Simple Naive Bayes model from the e1071 package.
NBmodel = naiveBayes(class ~ ., cars)

# Named lists where selectable input names to show in UI are linked with the
# dataset column names.
buying = c("Low" = "low", "Medium" = "med", "High" = "high",
           "Very high" = "vhigh")
maintenance = c("Low" = "low", "Medium" = "med", "High" = "high",
                "Very high" = "vhigh")
doors = c("Two" = "2", "Three" = "3", "Four" = "4",
          "More than four" = "5more")
persons = c("Two" = "2", "Four" = "4", "More than four" = "more")
lug_boot = c("Small" = "small", "Medium" = "med", "Big" = "big")
safety = c("Low" = "low", "Medium" = "med", "High" = "high")

# Define UI for application.
ui = fluidPage(
    # Set theme for UI.
    theme = shinytheme("cyborg"),

    # Application title.
    titlePanel(h1(align = "center", "Car Quality Estimation"),
               windowTitle = "Car Quality Estimation"),
    helpText(align = "center", "Input informations about the car and click the
             \'Estimate!\' button to have a car quality estimation."),
    
    br(),
    br(),
    
    fluidRow(
        column(4, selectInput("buyingID", "Price:",
                              choices = buying)),
        column(4, selectInput("maintenanceID", "Maintenance Level:",
                              choices = maintenance)),
        column(4, selectInput("doorsID", "Number of doors:",
                              choices = doors))
    ),
    fluidRow(
        column(4, selectInput("personsID", "Seating capacity:",
                              choices = persons)),
        column(4, selectInput("lug_bootID", "Luggage size:",
                              choices = lug_boot)),
        column(4, selectInput("safetyID", "Safety:",
                              choices = safety))
    ),
    fluidRow(
        column(12, actionButton("estimateButtonID", "Estimate!"),
               h3(textOutput("resultID")))
    )

)

# Define server logic.
server = function(input, output) {
    # All back end code will run once the "Estimate!" button is clicked.
    observeEvent(input$estimateButtonID, {
        carToPredict = data.frame("buying" = input$buyingID,
                                  "maintenance" = input$maintenanceID,
                                  "doors" = input$doorsID,
                                  "persons" = input$personsID,
                                  "lug_boot" = input$lug_bootID,
                                  "safety" = input$safetyID)
        
        prediction = as.character(predict(NBmodel, carToPredict))
        
        # Rename predicted classes to make them more clear in the UI.
        prediction[prediction == "acc"] = "acceptable."
        prediction[prediction == "unacc"] = "unacceptable."
        prediction[prediction == "good"] = "good."
        prediction[prediction == "vgood"] = "very good."
        
        prediction = paste0("Estimated car quality: ", prediction)
        output$resultID = renderText({
            prediction
        })
    })
}

# Run the application.
shinyApp(ui = ui, server = server)
