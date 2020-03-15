library(pacman)
p_load('tidyverse','tswge')

BLCN = rbind(NASDAQ_Daily_BLCN_2019,NASDAQ_Daily_BLCN_2020)

skimr::skim(BLCN)
BLCN$times = as.Date(BLCN$times, format = "%Y-%m-%d")

#Generate plots for open/close for BLCN stock prices.
ggplot(BLCN, aes(x=times))+
  geom_line(aes(y=close), color = 'red') +
  geom_line(aes(y=open), color = 'blue')

#Generate canges in volume over the course of the stock's life
ggplot(BLCN, aes(x=times, y = volume)) +
  geom_line()

# TIME SERIES PLOTS ##################################################################
#Realization shows potential wandering behavior indicative of ARIMA
plotts.sample.wge(BLCN$open)

#Realization shows potential wandering behavior indicative of ARIMA
plotts.sample.wge(BLCN$volume)
acf(BLCN$volume)

#identify best model
#aic suggests AR(1)
aic5.wge(BLCN$close)
#aic suggestsARMA(1,1)
aic5.wge(BLCN$volume)

#bic suggest ar(1)
aic5.wge(BLCN$open, p = 0:5, q=0:3, type = 'bic')
#bic suggests arma(1,1)
aic5.wge(BLCN$volume, p = 0:5, q=0:3, type = 'bic')

#factor tables
factor.wge(BLCN$close)
factor.wge(BLCN$volume)

#difference data for close
#looks like white noise
close.dif = artrans.wge(BLCN$open, phi.tr=1)
plotts.sample.wge(close.dif)
acf(close.dif)

#difference data for volume
volume.dif = artrans.wge(BLCN$volume, phi.tr = 1)
acf(volume.dif)
#generate potential models
est.ar.wge(close.dif, p = 1)
est.arma.wge(volume.dif, p = 1, q = 1)

# forecast##############################################################
#Forcast for close
fore.aruma.wge(close.dif, d = 1, phi = 0.0596, n.ahead = 30)

#forcase for volume
fore.aruma.wge(volume.dif,d=1, phi = 0.1126343, theta = 0.944441, n.ahead = 30)


