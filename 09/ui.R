## library(markdown)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("mtcars - effect of Transmission (Auto/Manual) and Weight on Mileage"),
    sidebarPanel(
      h2('Choose Transmission Type'),
      br(),
      # radioButtons(inputId, label, choices, selected = NULL, inline = FALSE, width = NULL)
      selectInput("id1", "Checkbox",
                         c("Automatic Transmission" = "Automatic Transmission",
                           "Manual Transmission" = "Manual Transmission",
                           "Both" = "Automatic and Manual Transmission"), selected = "Automatic Transmission"
      ),
      submitButton('Submit')
    ),
    mainPanel(
      verbatimTextOutput("oid1"),
      plotOutput('RegModel'),
      br(),
      includeHTML("BaseMaterial.html")
    )
  )
)