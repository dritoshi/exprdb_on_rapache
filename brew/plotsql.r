<%
find_by_id <- function(dbname, id) {
  drv <- dbDriver("SQLite")
  con <- dbConnect(drv, dbname = dbname)
  sql <- paste('select * from expdb where id = "', id, '" limit 1', sep="")
  # cat(sql, "\n")
  q <- dbGetQuery(con, sql)
  dbDisconnect(con)
  return(q)
}

# conf
dbname <- "/var/www/brew/expdb.sqlite3"

# GET
id <- GET$id
# sanitize
if (length(id) == 0) {
  id <- ""
} else {
  id.check <- any(grep("^[[:digit:]]{6}_at", id))
  if (! id.check ) {
    cat("Not found.", "\n")
  }
}

# query
q  <- find_by_id(dbname, id)
q.count <- nrow(q)
if (q.count > 0) {
  df <- data.frame(expression=unlist(q[-1]), day=c(0,2,4,10))

  # make file
  image_dir <- "/var/www/images"
  filename  <- paste(id, ".png", sep="")
  filepath  <- paste(image_dir, filename, sep="/")

  if (! file.exists(filepath)) { # for demo.
    # plot
    png(filepath)
    p <- ggplot(df, aes(x=day, y=expression))
    p <- p + geom_line()
    print(p)
    dev.off()
  }    
  
  # output
  cat("ID: ")
  cat(id)
  cat("\n")
  cat(paste('<p><img src="/images/', filename, '"><P>', sep=""))
}
%>
