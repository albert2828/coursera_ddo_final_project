library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # Fitting the model
    library(caret)
    library(randomForest)
    app_data <- read.csv("app_data.csv")
    app_data <- app_data[,-1]
    model <- train(Present_Price~., data = app_data, method="rf",
                      trControl = trainControl("cv", number = 3))
    
    modelpred <- reactive({
        new_data <- data.frame(age=input$age,
                               Fuel_Type=input$Fuel_Type,
                               Kms_Driven = input$Kms_Driven,
                               Transmission = input$Transmission,
                               Seller_Type=input$Seller_type,
                               Owner=as.numeric(input$Owner))
        predict(model, newdata = new_data)
    })
    
    output$pred <- renderText({
        paste("$",floor(1000*modelpred()))
    })

})


