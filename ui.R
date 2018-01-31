# ui  code for closetMaid calculator
library("shiny")
library("shinythemes")

shinyUI(fluidPage(theme = shinytheme("cosmo"),
  titlePanel("Calculator to estimate the cost of a ClosetMaid addtion"),

  sidebarLayout(
    sidebarPanel(
      helpText("This app estimates the cost of all the parts of a ClosetMaid addition based on your inputs."),
      sliderInput("mounts",
                  label = h6("Number of wall mounts:"),
                  min = 0,
                  max = 20,
                  value = 0),
      sliderInput("brackets",
                  label = h6("Number of shelf brackets:"),
                  min = 0,
                  max = 60,
                  value = 0),
      sliderInput("long_shelf",
                  label = h6("Number of long shelves:"),
                  min = 0,
                  max = 40,
                  value = 0),
      br(),
      sliderInput("short_shelf",
                  label = h6("Number of short shelves:"),
                  min = 0,
                  max = 10,
                  value = 0),
      sliderInput("rod",
                  label = h6('Number of 72" rods'),
                  min = 0,
                  max = 10,
                  value = 0),
      sliderInput("rod_bracket",
                  label = h6("Number of rod brackets"),
                  min = 0,
                  max = 50,
                  value = 0),
      sliderInput("long_track",
                  label = h6("Number of hang tracks"),
                  min = 0,
                  max = 8,
                  value = 0),
      actionButton("action_Calc", label = "Refresh & Calculate")
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Output",
               p(h5("Your entered values:")),
               textOutput("text_mounts"),
               textOutput("text_brackets"),
               textOutput("text_long_shelf"),
               textOutput("text_short_shelf"),
               textOutput("text_rod"),
               textOutput("text_rod_brackets"),
               textOutput("text_hang_tracks"),
               br(),
               p(h5("Calculated values:")),
               textOutput("text_int")
      ),
      tabPanel("Documentation",
              br(),
              p(h4(a("ClosetMaid Wire Shelving System", href = "https://www.homedepot.com/s/closetmaid+wire+shelves?NCNI-5", target = "_blank"))),
              p(h5("The minimum requirements for the ClosetMaid system are: a series of mounts that attach to the wall, brackets that attach to the wall mounts and hold up the shevles, and the shelves themselves. You can add a clothes rod to each shelf, which requires rod brackets to attach the shelf.")),
              p(h4("ClosetMaid cost estimator:")),
              helpText("This application calculates the base cost at Home Depot plus California sales tax"),
              HTML('<u><b>Equation for calculation: </b></u>
                  <br> <br>
                  <b> Total = WM + BR + LS + ShS + Rd + RB + HT = Sub total + 7.5% </b>
                  <br>
                  where: <br>
                  <b>WM</b> = Wall Mounts ($15.44 ea)<br>
                  <b>BR</b> = Brackets ($6.98 ea)<br>
                  <b>LS</b> = Long Shelves 6ft x 16in ($13.20 ea)<br>
                  <b>ShS</b> = Short Shelves 4ft x 16in ($8.98 ea)<br>
                  <b>Rd</b> = 72" rods ($9.45 ea)<br>
                  <b>RB</b> = Rod Brackets ($1.48 ea)<br>
                  <b>HT</b> = Hang tracks ($22.44 ea)<br>
                  <br>
                  This calculation includes wire caps for the ends of each shelf and end caps for each rod.'
                  ),
              DT::dataTableOutput('tbl'))
                )
              )
          )
))
