<%
id <- "100001_at"

image_dir <- "/var/www/images"
filename  <- paste(id, ".png", sep="")
filepath  <- paste(image_dir, filename, sep="/")
 
#library("ggplot2")
load("/var/www/brew/rma.rdat")

df <- data.frame(
  expression=as.numeric(exp[exp[,1] == id,-1]),
  day=c(0,2,4,10)
)

png(filepath)
p <- ggplot(df, aes(x=day, y=expression))
p <- p + geom_line()
print(p)
dev.off()
%>
<img src="/images/<%=filename%>">