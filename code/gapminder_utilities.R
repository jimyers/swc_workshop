calcGDP <- function(poop, year=NULL, country=NULL){
  #if year is not NULL do this
  if(!is.null(year)){
    poop <- poop[poop$year == year,]
  }
  #if country is not NULL do this
  if(!is.null(country)){
    poop <- poop[poop$country == country,]
  }
  
  gdp <- poop$pop * poop$gdpPercap
  farts <- cbind(poop, gdp)
  return(farts)
}

