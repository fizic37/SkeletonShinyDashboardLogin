#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    #gfonts::use_font(id = "playfair-display",css_path = 'inst/app/www/playfair_regular.css',selector = "logo"),
    shinydashboard::dashboardPage(skin="blue",
                                  
          header = shinydashboard::dashboardHeader(title = "EXAMPLE"),
                                  
          sidebar = shinydashboard::dashboardSidebar(mod_sidebar_ui("sidebar_ui_1"),collapsed = FALSE),
                                  
          body = shinydashboard::dashboardBody(
                mod_login_ui("login_ui_1"),
                shinydashboard::tabItems(
                     shinydashboard::tabItem(tabName = "first_tab",mod_first_tab_ui("first_tab_ui_1")),
                      shinydashboard::tabItem(tabName = "second_tab",mod_second_tab_ui("second_tab_ui_1"))
                )
        )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'SkeletonShinyDashboardLogin'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

