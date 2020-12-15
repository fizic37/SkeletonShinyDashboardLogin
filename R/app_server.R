#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  
  login <- FALSE
  sidebar_selected <- c()
  vals <- reactiveValues(login=login,sidebar_selected = sidebar_selected)
  
 
  callModule(mod_login_server, "login_ui_1", vals)
  callModule(mod_sidebar_server, "sidebar_ui_1", vals)
  
  
  # Use if, there is no else if. 
  
  observeEvent(vals$sidebar_selected,{
    
    if (sum("first_tab" == vals$sidebar_selected)==1) {
      callModule(mod_first_tab_server, "first_tab_ui_1")
      vals$sidebar_selected <- c(vals$sidebar_selected,"first_tab")
    }
    
    if (sum("second_tab" == vals$sidebar_selected)==1) {
      callModule(mod_second_tab_server, "second_tab_ui_1")
      vals$sidebar_selected <- c(vals$sidebar_selected,"second_tab")
    }  # this speeds up the process
    
  })

}
