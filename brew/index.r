<% setContentType('text/html') %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head><title>Demo: R + Rapache + Brew + RSQLite + ggplot2 on Amaozn EC2</title>
</head>
<body>
  <h1>Simple Gene Expression DB</h1>
  <p>Demo: R + Rapache + Brew + RSQLite + ggplot2 on Amaozn EC2</p>
  <P>
  <form method="GET" action="index.r">         
    <input type="text" name="id" value="100030_at">         
    <input type="submit"> (example: 100030_at)
  </form>  
  </P>  
  <P>
  <% brew('/var/www/brew/plotsql.r') %>
  </P>
  <P>
    <a href="/brew/index.r">Top</a>
  </P>
  <ul>
    <li><a href="http://blog.itoshi.tv/2010/03/expression_database_on_rapache_brew/">Details of this page (in Japanese)</a>
    <li><a href="../RApacheInfo">RApacheInfo</a>
    <li><a href="http://www.ncbi.nlm.nih.gov/projects/geo/query/acc.cgi?acc=GSE2192">Demo Data (NCBI GEO)</a>
  </ul>    
  <hr>
  <a href="mailto:dritoshi@gmail.com">Itoshi NIKAIDO, Ph.D.</a>
</body>
</html>