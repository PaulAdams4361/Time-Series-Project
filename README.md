Created by [Paul Adams](https://github.com/PaulAdams4361) and [Jeff Nguyen](https://github.com/7446Nguyen).
# Time-Series Analysis 
## Market Trading Investments Forecasting Strategy with ARIMA, Signal-Plus-Noise, Multiple Linear Regression for Time Series, Neural Networks with Multi-Layered Perceptrons, and Vector Autoregressive Modeling
### Project Background
In this project, we analyze 3,202 stock price and volume data time series traded on the NASDAQ exchange between May 30th and October 30th, 2019. This date range was selected for its distance from recent, significant market disruption in order to build a proof of concept model for selecting and forecasting prices. Data was sourced as comma-separated values through API from AlphaVantage.

### Analysis
We applied automated, iterative pre-processing to analyze all stocks and provide candidate models for direct analysis. Through this analysis, we identified one stock and modeled its time series using ARIMA, composite ensemble, Neural Networks using Multi-Layered Perceptrons, Signal-Plus-Noise, and Vector Autoregressive (VAR) models. Forecasting accuracy was assessed using  the Average Squared Error (ASE).

![Candlestick Plot for ACGL](./project_files/images/Candlestick_Plot.png)
