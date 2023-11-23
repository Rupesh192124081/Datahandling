# Load required libraries
library(ggplot2)
library(sf)
library(knitr)

# Geographic data
city_data <- data.frame(
  City = c("City A", "City B", "City C"),
  Population = c(500000, 700000, 600000),
  Avg_Temperature = c(75, 68, 80),
  Elevation = c(1000, 800, 1200)
)

# Create an sf data frame with point geometry
city_sf <- st_as_sf(city_data, coords = c("Elevation", "Avg_Temperature"), crs = 4326)

# Create a map chart
map_chart <- ggplot() +
  geom_sf(data = city_sf, aes(color = Population), size = 3) +
  scale_color_viridis_c() +
  labs(title = "Distribution of Cities on a Geographic Map", color = "Population") +
  theme_minimal()

# Create a scatter plot
scatter_plot <- ggplot(city_data, aes(x = Avg_Temperature, y = Population, label = City)) +
  geom_point(size = 3) +
  geom_text(vjust = 2) +
  labs(title = "Relationship between Average Temperature and Population Size", x = "Average Temperature", y = "Population") +
  theme_minimal()

# Create a table
geographic_table <- kable(city_data, col.names = c("City", "Population", "Average Temperature", "Elevation"), caption = "Geographic Data for Each City")

# Display charts and table
print(map_chart)
print(scatter_plot)
print(geographic_table)
