#
library("shiny")


# wm = wall mount
# sb = shelf bracket
# sl = long shelf
# ss = short sheld
# rd = rod (6")
# rb = rob bracket
# ht = long track (80")

shinyServer(function(input, output){
    values <- reactiveValues()

    # calculate tax
    observe({
      input$action_Calc
      values$int <- isolate({
        x1 <- input$mounts * 15.44 # wall mounts
        x2 <- input$brackets * 6.98 # support brackets
        x3 <- input$long_shelf * 13.20 # long shelves
        x4 <- input$short_shelf * 8.98 # short shelves
        x5 <- input$rod *  9.45 # periods
        x6 <- input$rod_bracket * 1.48 # rod text_brackets
        x7 <- input$long_track * 22.44 # hang track (long)
        x8 <- ceiling((sum(x3 + x4) * 4) / 14) * 1.48
        x9 <- x5 * 3.72
        sub_total <- sum(x1, x2, x3, x4, x5, x6, x7, x8, x9)
        est_total <- sub_total + ((sub_total / 100) * 7.5)
        round(est_total, 2)
      })
    })

    # Display entered values
    output$text_mounts <- renderText({
        paste("Number of wall mounts: ", input$mounts)
    })
    output$text_brackets <- renderText({
        paste("Number of brackets: ", input$brackets)
    })
    output$text_long_shelf <- renderText({
        paste("Number of long shelves: ", input$long_shelf)
    })
    output$text_short_shelf <- renderText({
        paste("Number of short shelves: ", input$short_shelf)
    })
    output$text_rod <- renderText({
        paste('Number of 72" rods: ', input$rod)
    })
    output$text_rod_brackets <- renderText({
        paste("Number of rod brackets: ", input$rod_bracket)
    })
    output$text_hang_tracks <- renderText({
        paste("Number of hang tracks: ", input$long_track)
    })
    # Display calculated values
    output$text_int <- renderText({
        paste("Estimated cost $:", values$int)
    })
})
