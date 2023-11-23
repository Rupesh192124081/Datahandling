# Load necessary libraries
library(sf)
library(leaflet)

# Create a sample geographic dataframe with latitude and longitude
locations <- data.frame(
  Latitude = c(35.6895, 37.7749, 40.7128, 34.0522),
  Longitude = c(139.6917, -122.4194, -74.0060, -118.2437)
)

# Combine weather_data and locations dataframes
weather_locations <- cbind(weather_data, locations)

# Convert the dataframe to a Simple Features (sf) object
sf_weather <- st_as_sf(weather_locations, coords = c("Longitude", "Latitude"), crs = 4326)

# Create a map
leaflet(sf_weather) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addCircleMarkers(radius = ~Temperature, color = "red", label = ~paste("Temperature:", Temperature, "°C"))

#2
average_temperature <- aggregate(Temperature ~ Date, data = weather_data, FUN = mean)

# Scatter plot
scatter_plot <- ggplot(weather_data, aes(x = average_temperature$Temperature, y = Precipitation)) +
  geom_point() +
  labs(title = "Scatter Plot: Average Temperature vs. Precipitation",
       x = "Average Temperature (°C)",
       y = "Precipitation (mm)") +
  theme_minimal()

# Print the plot
print(scatter_plot)
#3
# Weather data
library(knitr)
weather_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04")),
  Temperature = c(12, 9, 15, 8),
  Precipitation = c(0.5, 2.0, 0.0, 5.0)
)

# Print the table
knitr::kable(weather_data, caption = "Weather Data for Each Date", align = "c")
