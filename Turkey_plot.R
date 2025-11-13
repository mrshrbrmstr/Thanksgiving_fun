library(ggplot2)
library(ggimage)

# Data (years, weights, and icon path)
data <- data.frame(
  year = c(1929, 1960, 1980, 2013, 2017, 2021, 2024),
  weight = c(13.2, 15.1, 19, 30.3, 31.1, 33.1, 32.8),
  image = "turkey_icon2.png"
)

ggplot(data, aes(x = year, y = weight)) +
  # Draw the polynomial (order 2) best fit curve first (brown, beneath the icons)
  geom_smooth(
    method = "lm",
    formula = y ~ poly(x, 2),
    se = FALSE,
    color = "brown",
    lwd = 1.2
  ) +
  # Now add the icons on top, at an appropriate size
  geom_image(aes(image = image), size = 0.12) +
  labs(
    title = "Average Turkey Size in the US",
    x = "Year",
    y = "Average Turkey Weight (lbs)"
  )
# Fit quadratic (order 2 polynomial) model
model <- lm(weight ~ poly(year, 2, raw = TRUE), data = data)

# View model summary for coefficients and parameters
summary(model)

# For just the coefficients:
coef(model)
