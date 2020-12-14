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
    
    if (sum("home" == vals$sidebar_selected)==1) {
      callModule(mod_home_server, "home_ui_1",vals)
      vals$sidebar_selected <- c(vals$sidebar_selected,"home")
    }
    
    if (sum("solduri" == vals$sidebar_selected)==1) {
      callModule(mod_portofoliu_server, "portofoliu_ui_1")
      vals$sidebar_selected <- c(vals$sidebar_selected,"solduri")
    }  # this speeds up the process
    
  })

}
