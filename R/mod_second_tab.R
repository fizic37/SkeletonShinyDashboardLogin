#' second_tab UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_second_tab_ui <- function(id){
  ns <- NS(id)
  h3("This is just text with no server side processing")
}
    
#' second_tab Server Function
#'
#' @noRd 
mod_second_tab_server <- function(input, output, session){
  ns <- session$ns
  
  
 
}
    
## To be copied in the UI
# mod_second_tab_ui("second_tab_ui_1")
    
## To be copied in the server
# callModule(mod_second_tab_server, "second_tab_ui_1")
 
