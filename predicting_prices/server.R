library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # Fitting the model
    library(caret)
    library(randomForest)
    data <- read.csv("app_data.csv", header = TRUE)
    model <- model_rf <- train(Present_Price~., data = data, method="rf",
                               trControl = trainControl("cv", number = 3))
    
    modelpred <- reactive({
        predict(model, newdata = data.frame(age=input$age,
                                            Fuel_Type=input$Fuel_Type,
                                            Kms_Driven = input$Kms_Driven,
                                            Transmission = input$Transmission,
                                            Seller_Type=input$Seller_type,
                                            Owner=as.numeric(input$Owner)))
    })
    
    output$pred <- renderText({
        paste("$", floor(1000*modelpred()))
    })

})


