library(tidyverse)
library(readxl)
library(lubridate)
library(magrittr)

excel <- read_excel(here::here("./excel-time.xlsx"),
                    skip = 1,
                    col_names = c("Date", "excel_as_numeric", "excel_calculated_diff"),
                    col_types = c("date", "numeric", "numeric"))

today <- ymd_hms("2020/09/14 00:00:00")

excel %<>%
    mutate(calculated_days = as.numeric(Date - ymd_hms("1900/01/01 00:00:00"),
                                        units = "days"),
           same = calculated_days == excel_calculated_diff)

View(excel)
write_excel_csv(excel, here::here("./excel_time_format.csv"))
