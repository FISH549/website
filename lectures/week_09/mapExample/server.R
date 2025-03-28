# Here is the server side 

server <- function(input, output, session) {
  # Notice that the output object var2plot is a reactive object, meaning it is recalculated every time something changes on the user side (they enter a value, move a slider, etc). You access it in other elements of the output list using var2plot(), in the same way that you would call a normal object in r (you'll see it below)
  var2plot <- reactive(mack[, input$which_var])
  
  output$mymap <- renderLeaflet({
    data(mack)
    
    fishpal <- colorNumeric(RColorBrewer::brewer.pal(6, name = "YlOrRd"), mack$var2plot)
    
    # This is how you call a reactive object in Shiny! You could call it anything
    x <- var2plot()
    
    dat2plot <- mack |>
      tibble::add_column(x) |>
      dplyr::filter(egg.dens > 0 & !is.na(x))
    
    leaflet(data = dat2plot) |>
      addTiles() |>
      addCircleMarkers(
        ~lon, ~lat,
        radius = ~ egg.dens / 30,
        color = ~ fishpal(x),
        stroke = FALSE,
        fillOpacity = 0.5
      ) |>
      addProviderTiles("Esri.WorldImagery")
  })
  
  output$user_corr <- renderPlot({
    data(mack)
    x <- var2plot()
    
    mack |>
      tibble::add_column(x) |>
      ggplot(aes(x = egg.dens / 30, y = x)) +
      geom_point() +
      xlab("Egg density / 30") +
      ylab(stringr::str_to_sentence(get("input")[["which_var"]])) +
      hrbrthemes::theme_ft_rc() +
      theme(
        axis.title.x = element_text(size = 20),
        axis.title.y = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.background = element_rect(fill = "#222222"),
        panel.background = element_rect(fill = "#222222")
      )
  })
  
  output$new_map <- renderLeaflet({
    icon.fa <- makeAwesomeIcon(
      icon = "fish",
      markerColor = "lightblue",
      library = "fa",
      iconColor = "black"
    )
    
    leaflet() |>
      addProviderTiles(
        "Esri.WorldStreetMap",
        group = "Esri.WorldStreetMap"
      ) |>
      addProviderTiles(
        "Wikimedia",
        group = "Wikimedia"
      ) |>
      addLayersControl(
        baseGroups = c(
          "Esri.WorldStreetMap",
          "Wikimedia"
          
          # Other layer options
          # "OpenStreetMap", "Stamen.Toner",
          # "Stamen.Terrain",
          # "CartoDB.Positron", "Esri.WorldImagery"
        ),
        # position of layer controller
        position = "topleft"
      ) |>
      addMarkers(
        lat = 47.65333348572457,
        lng = -122.3164483455216,
        icon = makeIcon(
          iconRetinaUrl = "0n_maps/glyphicons-basic-259-fishes@2x.png",
          24, 24
        )
      )
  })
}