import datetime as dt
import matplotlib.pyplot as plt
from matplotlib import style
import mplfinance as mpf
import pandas as pd
import pandas_datareader.data as web ##Read data##
import numpy as np
style.use ('ggplot')

start = dt.datetime(2010,1,1)
end = str(dt.datetime.now().strftime('%Y-%m-%d'))

TSLA = 'TSLA'

def get_stats(stock_data):
    return{
            'last' :  np.mean(stock_data.tail(1)),
            'short_mean' : np.mean(stock_data.tail(20)),
            'long_mean' : np.mean(stock_data.tail(200)),
            'short_rolling': stock_data.rolling(window=20).mean(),
            'long_rolling': stock_data.rolling(window=200).mean()
        }

def clean_data(stock_data,col):
    weekdays = pd.date_range(start=start,end=end)
    clean_data = stock_data[col].reindex(weekdays)
    return clean_data.fillna(method = 'ffill')

def create_plot(stock_data,ticker):
       stats = get_stats(stock_data)
       plt.style.use('dark_background')
       plt.subplots(figsize = (12,8))
       plt.plot(stock_data, label=ticker)
       plt.plot(stats['short_rolling'], label = '20 day rolling mean')
       plt.plot(stats['long_rolling'], label = '200 day rolling mean')
       plt.xlabel('Date')
       plt.ylabel('Adj Close(p)')
       plt.title('TSLA adjusted stock price since inception')
       plt.legend()
       plt.show()
    
def get_data(ticker):

        stock_data = web.DataReader(ticker,'yahoo',start,end)
        adj_close = clean_data(stock_data,'Adj Close')
        create_plot(adj_close,TSLA)
    

get_data(TSLA)
