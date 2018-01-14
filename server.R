# Server code for closetMaid calculator
library("shiny")

# wm = wall mount
# sb = shelf bracket
# sl = long shelf
# ss = short shelf
# rd = rod (6")
# rb = rod bracket
# ht = long track (80")

m1 <- matrix(c("Wall mount", "Shelf bracket", "Long shelf", "Short shelf", "Rod", "Rod brackets", "Hang tracks", '84" x 1"', '16" x 0.5"', '72" x 16"', '48" x 16"', '72"', '6" x 1"', '80"', '<a href="https://www.homedepot.com/p/ClosetMaid-ShelfTrack-84-in-x-1-in-White-Standard-2812/100194576">Link</a>', '<a href="https://www.homedepot.com/p/ClosetMaid-ShelfTrack-84-in-x-1-in-White-Standard-2812/100194576">Link</a>', '<a href="https://www.homedepot.com/p/ClosetMaid-SuperSlide-72-in-W-x-16-in-D-White-Ventilated-Wire-Shelf-4735/100146445">Link</a>', '<a href="https://www.homedepot.com/p/ClosetMaid-SuperSlide-48-in-W-x-16-in-D-Ventilated-Linen-Shelf-4726/100016564">Link</a>', '<a href="https://www.homedepot.com/p/ClosetMaid-SuperSlide-6-ft-White-Closet-Rod-2058/100133925">Link</a>', '<a href="https://www.homedepot.com/p/ClosetMaid-SuperSlide-6-in-x-1-in-White-Closet-Rod-Bracket-5629/100036913?MERCH=REC-_-SearchPLPHorizontal1_rr-_-NA-_-100036913-_-N">Link</a>', '<a href="https://www.homedepot.com/p/ClosetMaid-ShelfTrack-80-in-White-Hang-Track-2836/100136597">Link</a>'), 7)
colnames(m1) <- c("Part", "Dimenions", "Web")
# datatable(m1, escape = FALSE)


shinyServer(function(input, output){
    values <- reactiveValues()

    # calculate tax
    observe({
      input$action_Calc
      values$int <- isolate({
        x1 <- input$mounts * 15.44 # wall mounts
        x2 <- input$brackets * 6.98 # support brackets
        x3 <- input$long_shelf * 12.40 # long shelves
        x4 <- input$short_shelf * 8.55 # short shelves
        x5 <- input$rod *  8.98 # periods
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
    br()
    output$tbl <- DT::renderDataTable(DT::datatable(m1, escape = FALSE, options = list(lengthChange = FALSE, paging = FALSE, searchable = FALSE)))
    #output$tbl <- datatable(m1, escape = FALSE)
})
