<%
randomFileName <- function(prefix, postfix) {
  filename <- paste(
    prefix,
    sprintf("%08d", as.integer(runif(1, 0, 10^7))),
    postfix,
    sep=""
  )
  return(filename)
}

image_dir <- "/var/www/images"
filename  <- randomFileName("hist_", ".png")
filepath  <- paste(image_dir, filename, sep="/")

data <- rnorm(1000)
png(filepath)
hist(data)
dev.off()
%>
<img src="/images/<%=filename%>">