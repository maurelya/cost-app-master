# calculator page
sidebarLayout(
  sidebarPanel(

  tags$h4(tags$b("Click one of the tabs below to add a component to the treatment protocol."), style = "color: #4177b7"),
  
  tags$style(HTML("
                  .tabs-above > .nav > li[class=active] > a {
                  font-weight: bold;
                  background-color: #b38600;
                  color: #0f1e3e;
                  }")),
    
  tags$style(HTML("
                  .tabs-above > .nav > li > a {
                  font-weight: bold;
                  background-color: #f2f2f2;
                  color: #0f1e3e;
                  }")),
  
  tabsetPanel( type ="pills", id = "in.components",
               
               
               tabPanel(
                 title = "Individual Treatment", value = "tab.in",
                 shinyjs::hidden(textInput("id.ind", "Id", "0")),
                 shinyjs::hidden(textInput("cost.ind", "Cost", "0")), #in future try to synchronize
                 textInput(inputId = "label.ind", label = "Label:",
                           placeholder = "Type a label for this component here (e.g., 'teacher consultation')"),
                 splitLayout(
                   textInput(inputId = "frequency.ind", label = "Frequency (per year):", value = 0),
                   textInput(inputId = "duration.ind", label = "Duration per session (in minutes):", value = "0"),
                   cellWidths = c("40%", "60%")
                 ),
                 hr(),
                 div(id = "p1.ind",
                     selectizeInput(inputId = "person1.ind", label = "Person 1", choices = df.comps$person,
                                    options = list(placeholder = "Choose a person from the list",
                                                   onInitialize = I('function() { this.setValue(""); }'))),
                     textInput(inputId = "p1.comm.ind", label = "Person 1 Commute Time (one-way in min)", value = "0"),
                     a(id = "add.person2.ind", tags$b("Show/Hide Person 2"), style = "color: #4177b7"),
                     tags$br(),
                     tags$br()
                 ),
                 shinyjs::hidden(
                   div(id = "p2.ind",
                       selectizeInput(inputId = paste0("person", 2, ".ind"), label = paste0("Person ", 2), choices = df.comps$person,
                                      options = list(placeholder = "Choose a person from the list",
                                                     onInitialize = I('function() { this.setValue(""); }'))),
                       textInput(inputId = paste0("p", 2, ".comm.ind"), label = paste0("Person ", 2, " Commute, one-way (min)" ), value = "0"),
                       a(id = "add.person3.ind", tags$b("Show/Hide Person 3"), style = "color: #4177b7"),
                       tags$br(),
                       tags$br()
                   )
                 ),
                 
                 shinyjs::hidden(
                   div(id = "p3.ind",
                       selectizeInput(inputId = paste0("person", 3, ".ind"), label = paste0("Person ", 3), choices = df.comps$person,
                                      options = list(placeholder = "Choose a person from the list",
                                                     onInitialize = I('function() { this.setValue(""); }'))),
                       textInput(inputId = paste0("p", 3, ".comm.ind"), label = paste0("Person ", 3, " Commute, one-way (min)" ), value = "0"),
                       a(id = "add.person4.ind", tags$b("Show/Hide Person 4"), style = "color: #4177b7"),
                       tags$br(),
                       tags$br()
                   )
                 ),
                 
                 shinyjs::hidden(
                   div(id = "p4.ind",
                       selectizeInput(inputId = paste0("person", 4, ".ind"), label = paste0("Person ", 4), choices = df.comps$person,
                                      options = list(placeholder = "Choose a person from the list",
                                                     onInitialize = I('function() { this.setValue(""); }'))),
                       textInput(inputId = paste0("p", 4, ".comm.ind"), label = paste0("Person ", 4, " Commute, one-way (min)" ), value = "0"),
                       a(id = "add.person5.ind", tags$b("Show/Hide Person 5"), style = "color: #4177b7"),
                       tags$br(),
                       tags$br()
                   )
                 ),
                 
                 shinyjs::hidden(
                   div(id = "p5.ind",
                       selectizeInput(inputId = paste0("person", 5, ".ind"), label = paste0("Person ", 5), choices = df.comps$person,
                                      options = list(placeholder = "Choose a person from the list",
                                                     onInitialize = I('function() { this.setValue(""); }'))),
                       textInput(inputId = paste0("p", 5, ".comm.ind"), label = paste0("Person ", 5, " Commute, one-way (min)" ), value = "0"),
                       #  a(id = "add.person4.ind", "Add Person"),
                       tags$br(),
                       tags$br()
                   )
                 ),
                 
                 actionButton(inputId = "submit.ind", tags$a(href= NULL, class = "btn btn-primary", "Submit")),
                 actionButton(inputId = "reset.ind", tags$a(href= NULL, class = "btn btn-primary", "Reset fields")),
                 actionButton(inputId = "delete.ind", tags$a(href= NULL, class = "btn btn-primary", "Delete"))
                 
               ),
               tabPanel(
                 title = "Group Treatment", value = "tab.gr",
                 shinyjs::hidden(textInput("id.gr", "Id", "0")),
                 shinyjs::hidden(textInput("cost.gr", "Cost", "0")),
                 textInput(inputId = "label.gr", label = "Label:",
                           placeholder = "Type a label for this component here (e.g., 'parent training')"),
                 splitLayout(
                   textInput(inputId = "frequency.gr", label = "Frequency (per year):", value = 0),
                   textInput(inputId = "duration.gr", label = "Duration per session (in minutes):", value = "0"),
                   cellWidths = c("40%", "60%")
                   ),
                 textInput(inputId = "num.families.gr", label = "How many children (or families) per group?:", value = "1"),
                 hr(),
                 div(id = "p1.gr",
                     selectizeInput(inputId = "person1.gr", label = "Person 1", choices = df.comps$person,
                                    options = list(placeholder = "Choose a person from the list",
                                                   onInitialize = I('function() { this.setValue(""); }'))),
                     textInput(inputId = "p1.comm.gr", label = "Person 1 Commute Time (one-way in min)", value = "0"),
                     checkboxInput(inputId = "p1.lead.gr", label = "Check if Person 1 is leading the group.", value = FALSE),
                     a(id = "add.person2.gr", tags$b("Show/Hide Person 2"), style = "color: #4177b7"),
                     tags$br(),
                     tags$br()
                 ),
                 
                 
                 shinyjs::hidden(
                   div(id = "p2.gr",
                       selectizeInput(inputId = paste0("person", 2, ".gr"), label = paste0("Person ", 2), choices = df.comps$person,
                                      options = list(placeholder = "Choose a person from the list",
                                                     onInitialize = I('function() { this.setValue(""); }'))),
                       textInput(inputId = paste0("p", 2, ".comm.gr"), label = paste0("Person ", 2, " Commute, one-way (min)" ), value = "0"),
                       checkboxInput(inputId = "p2.lead.gr", label = "Check if Person 2 is leading the group.", value = FALSE),
                       a(id = "add.person3.gr", tags$b("Show/Hide Person 3"), style = "color: #4177b7"),
                       tags$br(),
                       tags$br()
                   )
                 ), 
                 
                 shinyjs::hidden(
                   div(id = "p3.gr",
                       selectizeInput(inputId = paste0("person", 3, ".gr"), label = paste0("Person ", 3), choices = df.comps$person,
                                      options = list(placeholder = "Choose a person from the list",
                                                     onInitialize = I('function() { this.setValue(""); }'))),
                       textInput(inputId = paste0("p", 3, ".comm.gr"), label = paste0("Person ", 3, " Commute, one-way (min)" ), value = "0"),
                       checkboxInput(inputId = "p3.lead.gr", label = "Check if Person 3 is leading the group.", value = FALSE),
                       a(id = "add.person4.gr", tags$b("Show/Hide Person 4"), style = "color: #4177b7"),
                       tags$br(),
                       tags$br()
                   )
                 ),
                 
                 shinyjs::hidden(
                   div(id = "p4.gr",
                       selectizeInput(inputId = paste0("person", 4, ".gr"), label = paste0("Person ", 4), choices = df.comps$person,
                                      options = list(placeholder = "Choose a person from the list",
                                                     onInitialize = I('function() { this.setValue(""); }'))),
                       textInput(inputId = paste0("p", 4, ".comm.gr"), label = paste0("Person ", 4, " Commute, one-way (min)" ), value = "0"),
                       checkboxInput(inputId = "p4.lead.gr", label = "Check if Person 4 is leading the group.", value = FALSE),
                       a(id = "add.person5.gr", tags$b("Show/Hide Person 5"), style = "color: #4177b7"),
                       tags$br(),
                       tags$br()
                   )
                 ),
                 
                 shinyjs::hidden(
                   div(id = "p5.gr",
                       selectizeInput(inputId = paste0("person", 5, ".gr"), label = paste0("Person ", 5), choices = df.comps$person,
                                      options = list(placeholder = "Choose a person from the list",
                                                     onInitialize = I('function() { this.setValue(""); }'))),
                       textInput(inputId = paste0("p", 5, ".comm.gr"), label = paste0("Person ", 5, " Commute, one-way (min)" ), value = "0"),
                       checkboxInput(inputId = "p5.lead.gr", label = "Check if Person 5 is leading the group.", value = FALSE),
                       tags$br(),
                       tags$br()
                   )
                 ),
                 
                 actionButton(inputId = "submit.gr", tags$a(href= NULL, class = "btn btn-primary", "Submit")),
                 actionButton(inputId = "reset.gr", tags$a(href= NULL, class = "btn btn-primary", "Reset fields")),
                 actionButton(inputId = "delete.gr", tags$a(href= NULL, class = "btn btn-primary", "Delete"))
                 
                 
               ),
               tabPanel(
                 title = "Medication", value = "tab.med",
                 shinyjs::hidden(textInput("id.med", "Id", "0")),
                 shinyjs::hidden(textInput("cost.med", "Cost", "0")),
                 selectizeInput(inputId = "label.med", label = "Medication:", choices = df.meds$name,
                                options = list(placeholder = "Choose a medication from the list",
                                               onInitialize = I('function() { this.setValue(""); }'))),
                 selectInput(inputId = "frequency.med", label = "Pills taken per day:",
                             choices = c(1, 2, 3)),
                 selectInput(inputId = "week.med", label = "Weekly schedule:",
                             choices = c("Everyday", "Weekdays only", "Weekends only")),
                 selectInput(inputId = "year.med", label = "Yearly schedule:",
                             choices = c("Year-round", "School year only", "Summer only")),
                 
                 actionButton(inputId = "submit.med", tags$a(href= NULL, class = "btn btn-primary", "Submit")),
                 actionButton(inputId = "reset.med", tags$a(href= NULL, class = "btn btn-primary", "Reset fields")),
                 actionButton(inputId = "delete.med", tags$a(href= NULL, class = "btn btn-primary", "Delete"))
                 
               )
  )
  
  ),
  mainPanel(

    tabsetPanel(
      tabPanel( title = "Component Lists",
                tags$body(
                  tags$div( 
                    tags$style("body {background-color: #0d2e55; }"),
                    tags$h4(textOutput("list.of.components")),
                    tags$h5(textOutput("indiv.treatment")),
                    tags$h5(htmlOutput("people.ind")),
                    tags$h5(textOutput("group.treatment")),
                    tags$h5(htmlOutput("people.gr")),
                    
                    # Uncomment for debugging
                    
                    #style = "color: white;",
                    
                    # tableOutput("inputvals")
                    #tableOutput("mytable.ind.1"),
                    #tableOutput("mytable.ind.2"),
                    
                    #tableOutput("mytable.gr.1"),
                    #tableOutput("mytable.gr.2"),
                    #tableOutput("mytable.gr.3"),
                    
                    #tableOutput("summary.by.person"),
                    
                    tabsetPanel(type = "pills", id = "out.components",
                                
                                tabPanel(
                                  title = "Individual Treatment", value = "tab.in",
                                  
                                  # Uncomment for debugging
                                  # tableOutput("mytable1"),
                                  # tableOutput("mytable2"),
                                  
                                  style = "color: #4177b7;",
                                  DT::dataTableOutput("data.table.ind.treatment", width = 500),
                                  downloadButton('download.table.ind.treatment', 'Download')
                                  
                                ), # close tabPanel Individual Treatment
                                
                                tabPanel(
                                  title = "Group Treatment", value = "tab.gr", 
                                  style = "color: #4177b7;",
                                  
                                  
                                  DT::dataTableOutput("data.table.gr.treatment", width = 500),
                                  downloadButton('download.table.gr.treatment', 'Download')
                                  
                                ), # close tabPanel Group Treatment
                                
                                tabPanel(
                                  title = "Medication", value = "tab.med",
                                  style = "color: #4177b7;",
                                  DT::dataTableOutput("data.table.med", width = 700),
                                  downloadButton('download.table.med', 'Download')
                                  
                                ) # close tabPanel Medication
                    )  # close tabsetPanel
                  ) # close tags$div
                ) # close tags$body
      ), # close Component List tab
      tabPanel(title = "Summary",
             
               br(),
               
               fluidRow(
                 column(12, offset= 0.5, 
                    h4(em("  All numbers reflect cost per child, per year:"), style = "color:white")
                   
                 )  
               ),   
            
               
               tags$style(HTML("
                   table {
                           padding: 30px 0px 0px 0px;
                           color: ##4177b7;
                         
                           # table-layout: fixed;
                           # width: 100%;
                           # These two lines would adjust the size of a table. Still trying to figure out how to modify it.
                         }
                            
                    th {
                         font-weight: bold;
                         background: #4177b7;
                         color: #ffffff;
                      }
                                              
                    td {
                         td width=1000px;
                       }")),

                fluidRow(
                  column(12, offset= 0.5,
                    
                    tags$h4(tags$b("Total Costs"), style = "color: #4177b7"),
                                             
                    #fluidRow(
                     splitLayout(
                               wellPanel(id ="summary.panel",
                                tableOutput('summary_1')
                               ), 
                              wellPanel(
                               tableOutput('summary_2')
                              ),
                              cellWidths = c("40%", "60%"),
                      
                      tags$head(tags$style("#summary_1 table {background-color: #CBA135 }", media="screen", type="text/css")),
                      
                      tags$style(type="text/css", "#summary_1 tr:last-child {font-weight:bold; color: white}"),
                      
                      tags$head(tags$style("#summary_2 table {background-color: #CBA135}", media="screen", type="text/css"))
                             
                    )
                  ) # close column
                # ) # close fluidRow
                ), # close wellPanel
              wellPanel(
            
                fluidRow(
                   column(12, offset= 0.5,
                     tags$h4(tags$b("Specific Costs"), style = "color: #4177b7"),
                   
                   #  fluidRow(
                    
                       splitLayout(cellWidths = c("40%", "60%"),
                        
                        wellPanel(             
                            tableOutput('summary_3')
                          , tableOutput('summary_4')
                          , tags$head(tags$style("#summary_3 table {background-color: white; width: 300px;}", media="screen", type="text/css"))
                          , tags$head(tags$style("#summary_4 table {background-color: white; width: 300px;}", media="screen", type="text/css"))
                        ),
                   
                        wellPanel(
                            tableOutput('summary_5')
                          , tableOutput('summary_6')
                          , tags$head(tags$style("#summary_5 table {background-color: white; width: 300px;}", media="screen", type="text/css"))
                          , tags$head(tags$style("#summary_6 table {background-color: white; width: 300px;}", media="screen", type="text/css"))
                       )
                    )# closse splitLayout   
                  ) # close column
                 ) #close fluid row
                ), # close wellPanel
              
                 fluidRow(
                   column(12, offset= 0.5,
                   splitLayout(cellWidths = c("40%", "60%"), 
                       # download Panel     
                         wellPanel(       
                          # splitLayout(
                              br(),
                              radioButtons('report.format', 'Report format', c('PDF', 'HTML', 'Word'),inline = TRUE),
                              downloadButton('download.report', 'Download Report'),
                              br()
                              
                           #   , cellWidths = c("60%", "40%")
                           #) 
                         #  , style = "padding: 100px;"
                         ), #close Download Panel
                        # save Panel  
                         wellPanel(
                             fluidRow(
                                  column(6, offset = 3),
                                  textInput("protocol.name", label = "", placeholder = "Enter the protocol name here", width = 450)         
                  
                              ), 
                             splitLayout(
                                  actionButton(inputId = "save.protocol", label = "Save Protocol for Comparison", icon = icon("save")),
                                 
                                  downloadButton("save.protocol.RDS", "Save Protocol to your Computer", class ="butt1"),
                                  # style font family as well in addition to background and font color
                                  # tags$head(tags$style(".butt1{background-color:orange;} .butt1{color: black;} .butt1{font-family: Courier New}")),  
                                  
                                  cellWidths = c("50%", "50%")
                             )
                          # , style = "padding: 10px;"
                           ) #close Save Panel   
                    )  
                  )
                ) # close fluidRow 
      ) 
                 
     ) # close Summary tab
    ) # close tabsetPanel
  ) # close mainPanel
  
  

#))
