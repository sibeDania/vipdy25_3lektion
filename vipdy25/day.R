get_day_name <- function(day_number) {
  
  days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
  
  if (day_number >= 1 && day_number <= length(days)) {
    return(days[day_number])
  } else {
    return("Invalid day number. Please enter a number between 1 and 7.")
  }
  
}

saveRDS(get_day_name, "C:/Users/sibe/OneDrive - EaDania/Datavisualisering/3. lektion/day.Rds")
