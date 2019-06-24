## Parabola
png("manuscript/resources/session2/parabola.png")
x <- seq(-5, 3, .1)
y <- -x^2 - 2 * x + 3
plot(x, y, type = "l")

a <- -1 
b <- -2
c <- 3

x1 <- (-b + sqrt(b^2 - 4 * a * c)) / (2 * a)
x2 <- (-b - sqrt(b^2 - 4 * a * c)) / (2 * a)

abline(h = 0, col = "grey")
abline(v = 0, col = "grey")
points(c(x1, x2), c(0, 0), col = "red", pch = 19)
dev.off()

## Histogram
b <- max(turbidity$Result) / 0.1
png("manuscript/resources/session2/histogram.png")
hist(turbidity$Result, breaks = b, main = "Turbidity Results")
dev.off()

## Boxplot example
d <- c(rnorm(100, 10, 2),
       rnorm(50, 10, 1),
       rep(8, 100))

png("manuscript/resources/session2/boxplot-example.png")
par(mar = rep(0, 4))
boxplot(d, axes = FALSE, col = "dodgerblue", border = "darkblue")
text(1.4, min(d), "Outlier (max)")
text(1.4, quantile(d, 0.25), "First Quartile")
text(1.4, median(d), "Median")
text(1.4, quantile(d, 0.75), "Third Quartile")
text(1.4, 14, "Outliers")
text(1.4, max(d), "Outlier (min)")
dev.off()

## Turbidity results
turbidity <- read.csv("session2/turbidity_laanecoorie.csv")
png("manuscript/resources/session2/boxplot-zones.png")
boxplot(Result ~ Zone, data = turbidity, col = "lightblue",
        main = "Turbidity Results Laanecoorie water system",
        ylab = "Turbidity (NTU)")
dev.off()
