#' first_tab UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_first_tab_ui <- function(id){
  ns <- NS(id)
  tagList(
  fileInput(inputId = ns("example_input"),label = "Input example file",accept = c(".xlsx",".xls"),
            buttonLabel = "Excel ony",placeholder = "no file uploaded"),
 
  verbatimTextOutput(ns("value_file_input")), 
  hr(),
  actionButton(inputId = ns("create_new_record"),label = "Click here to insert and save new record")
  )
}
    
#' first_tab Server Function
#'
#' @noRd 
mod_first_tab_server <- function(input, output, session){
  ns <- session$ns
  
  read_test <- read.csv(file = "R/reactivedata/test.csv")
  
  vals <- reactiveValues(read_test = read_test)
  
  output$value_file_input <- renderPrint({vals$read_test})
  
  observeEvent(input$create_new_record,{
      vals$read_test <- dplyr::bind_rows(vals$read_test,data.frame(Col1=sample(x = 1:10,size = 1,replace = T), 
                   Col2 = sample(LETTERS, size = 1, replace = T)))
      
      write.csv(x = vals$read_test, file="R/reactivedata/test.csv", row.names = F)
      })
 
      
  
 
}
    
## To be copied in the UI
# mod_first_tab_ui("first_tab_ui_1")
    
## To be copied in the server
# callModule(mod_first_tab_server, "first_tab_ui_1")
 
