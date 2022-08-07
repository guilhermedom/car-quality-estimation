library(shiny)
library(shinythemes)
library(e1071)

cars = read.csv("car.data", sep = ",")

NBmodel = naiveBayes(class ~ ., cars)

buying = unique(cars$buying)
maintenance = unique(cars$maint)
doors = unique(cars$doors)
persons = unique(cars$persons)
lug_boot = unique(cars$lug_boot)
safety = unique(cars$safety)

# Define UI for application
ui = fluidPage(
    theme = shinytheme("cyborg"),

    # Application title
    titlePanel(h1(align = "center", "Car Quality Estimation with Naive Bayes")),
    helpText(align = "center", "Input informations about the car and click the \'Estimate!\' button to have a car quality estimation."),
    
    br(),
    br(),
    
    fluidRow(
        column(4, selectInput("buyingID", "Price:", choices = buying)),
        column(4, selectInput("maintenanceID", "Maintenance Level:", choices = maintenance)),
        column(4, selectInput("doorsID", "Number of doors:", choices = doors))
    ),
    fluidRow(
        column(4, selectInput("personsID", "Seating capacity:", choices = persons)),
        column(4, selectInput("lug_bootID", "Luggage size:", choices = lug_boot)),
        column(4, selectInput("safetyID", "Safety:", choices = safety))
    ),
    fluidRow(
        column(12, actionButton("estimateButtonID", "Estimate!"), h2(textOutput("resultID")))
    )

)

# Define server logic
server = function(input, output) {
    observeEvent(input$estimateButtonID, {
        carToPredict = data.frame("buying" = input$buyingID, "maintenance" = input$maintenanceID,
                                  "doors" = input$doorsID, "persons" = input$personsID,
                                  "lug_boot" = input$lug_bootID, "safety" = input$safetyID)
        
        prediction = as.character(predict(NBmodel, carToPredict))
        prediction[prediction == "acc"] = "acceptable"
        prediction[prediction == "unacc"] = "unacceptable"
        prediction[prediction == "vgood"] = "very good"
        
        prediction = paste0("Estimated car quality: ", prediction)
        output$resultID = renderText({prediction})
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
