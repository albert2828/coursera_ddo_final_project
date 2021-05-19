library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Compute the price of your car"),

    
    sidebarLayout(
        sidebarPanel(
            sliderInput("age",
                        "Age of your car:",
                        min = 1,
                        max = 50,
                        value = 5),
            selectInput(inputId = "Fuel_Type", label = "Select the type of fuel your cars uses",
                        choices = c("Petrol", "Diesel"),
                        selected = "Petrol"),
            sliderInput("Kms_Driven",
                        "Kilometers Driven",
                        min = 1,
                        max = 500000, 
                        value = 5000),
            selectInput("Transmission", "Selectthe type of Transmission of your car",
                        choices = c("Automatic",  "Manual"),
                        selected = "Automatic"),
            selectInput("Seller_type", "Do you want to sell it yourseld or by a third party?",
                   choices = c("Dealer", "Individual"),
                   selected =" Dealer"),
            selectInput("Owner", "Number of previous owners",
                        choices = 0:5,
                        selected = 0),
            submitButton("Submit")
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
            h3("Aproximated price of your car"),
            textOutput(outputId = "pred"),
            br(),
            p("This app is made so you can aproximate the price of your car if you want to sell it"),
            p("You only need to fill a few gaps"),
            tags$ul(
                tags$li("Age: age of your car"),
                tags$li("Fuel Type: Petrol or Diesel (for the moment we are not prepared for electric cars)"),
                tags$li("Killometers Driven: if your cars runs in miles, multiply miles by 1.60934"),
                tags$li("Transmission: Automatic or Manual"),
                tags$li("Do you plan to sell it yourself of to go to an agency?"),
                tags$li("Number of owners: How may persons have had the car before you?")
            ),
            p("Finally, just click the Submit buttom!")
            )
        
        
        )
    )
)
