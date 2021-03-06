library(rChartsDygraphs); library(quantmod); require(data.table)
getSymbols("SPY", from = "1993-01-01")

dygraph(data=SPY, legendFollow=T, candlestick=T)
dygraph(data=SPY, legendFollow=T) #autodetects is.OHLC(data)

# trade annotations (arrows) example
trades= data.table(Instrument = c("SPY", "SPY", "SPY", "SPY", "SPY"),
               TradeID = 741:745, 
               PL = c(0.01256257562457, -0.00773754987439038, -0.000192819186643255, 
                      -0.00797906187922958, -0.00776722232180197), 
               Base = c(1685.96, 1691.75, 1763.31, 1807.23, 1841.07), 
               Start = as.Date(c(15916, 15975, 16008, 16036, 16069)), 
               End = as.Date(c(15922, 15981, 16014, 16043, 16076)), 
               Side = c(rep(c("Long", "Short"), each=2), "Long"))

dygraph(data=SPY[,"SPY.Close"], legendFollow=T, trades=trades)

