#!/usr/bin/env python3

from yahoo_fin import stock_info as si
roundNumber = 2;

def customticker(ticker):
    tickerPrice = si.get_live_price(ticker)
    return ticker + ': ' + str(round(tickerPrice, roundNumber))

def addTickers():
    tickers = ["NIO", "OCDO.L"]
    stocks = ""
    for ticker in tickers:
        stocks += " " + customticker(ticker) + " "
    print(stocks)

if __name__ == '__main__':
    addTickers()
