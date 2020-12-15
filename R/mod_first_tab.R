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
  verbatimTextOutput(ns("value_file_input"))
  )
}
    
#' first_tab Server Function
#'
#' @noRd 
mod_first_tab_server <- function(input, output, session){
  ns <- session$ns
  
  output$value_file_input <- renderPrint({input$example_input})
 
}
    
## To be copied in the UI
# mod_first_tab_ui("first_tab_ui_1")
    
## To be copied in the server
# callModule(mod_first_tab_server, "first_tab_ui_1")
 
