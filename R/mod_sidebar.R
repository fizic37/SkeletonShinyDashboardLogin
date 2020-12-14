#' sidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sidebar_ui <- function(id){
  ns <- NS(id)
  
  shinydashboard::sidebarMenuOutput(outputId = ns("sidebar"))
}
    
#' sidebar Server Function
#'
#' @noRd 
mod_sidebar_server <- function(input, output, session, vals){
  ns <- session$ns
 
  advanced_user_sidebar <- shinydashboard::sidebarMenu(id = ns("tabs"),
       shinydashboard::menuItem(tabName = "first_tab",text = "FirstTab",icon = icon("home")),
       shinydashboard::menuItem(tabName = "second_tab",  text = "SecondTab",icon=icon("euro-sign"),
                                selected = FALSE))
                                                  
  
  guest_user_sidebar <- shinydashboard::sidebarMenu(id = ns("tabs"),
        shinydashboard::menuItem(tabName = "first_tab",text = "FirstTab",icon = icon("home")))
                                                   
  
  
  
  output$sidebar <- shinydashboard::renderMenu({
    
    if (vals$login==FALSE) {return()}
    else if (vals$login==TRUE && vals$user_type=="guest-user") {return(guest_user_sidebar)}
    else {return(advanced_user_sidebar)}
    
    
  })
  
  observeEvent(input$tabs,{ 
    # I use this in order to have a selection of all inputs in sidebar. This way, I don`t have to call modules
    # every time a sidebar is selected, I only call modules ones.`
    vals$sidebar_selected <- c(vals$sidebar_selected,input$tabs)
    #vals$sidebar_selected <- input$tabs
  })
}
    
## To be copied in the UI
# mod_sidebar_ui("sidebar_ui_1")
    
## To be copied in the server
# callModule(mod_sidebar_server, "sidebar_ui_1")
 
