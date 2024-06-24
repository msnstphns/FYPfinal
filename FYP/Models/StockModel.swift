//
//  StockModel.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

/*API Token: X2YP8T4JHkLASc2vidWHtbtpfGij2SJj8DrFEtXL

MSFT,AAPL,NVDA,AMZN,META,GOOG,BRK.B,LLY,JPM,AVGO,XOM,UNH,V,TSLA,PG,MA,JNJ,HD,MRK,COST,ABBV,CVX,CRM,BAC,NFLX
 
https://api.stockdata.org/v1/data/quote?symbols=MSFT,AAPL,NVDA,AMZN,META,GOOG,BRK.B,LLY,JPM,AVGO,XOM,UNH,V,TSLA,PG,MA,JNJ,HD,MRK,COST,ABBV,CVX,CRM,BAC,NFLX&api_token=X2YP8T4JHkLASc2vidWHtbtpfGij2SJj8DrFEtXL
 
 {
   "meta": {
     "requested": 1,
     "returned": 1
   },
   "data": [
     {
       "ticker": "AAPL",
       "name": "Apple Inc",
       "exchange_short": null,
       "exchange_long": null,
       "mic_code": "IEXG",
       "currency": "USD",
       "price": 190.37,
       "day_high": 192.24,
       "day_low": 189.61,
       "day_open": 189.65,
       "52_week_high": 186.51,
       "52_week_low": 124.17,
       "market_cap": null,
       "previous_close_price": 190.08,
       "previous_close_price_time": "2024-05-28T16:00:00.000000",
       "day_change": 0.15,
       "volume": 741996,
       "is_extended_hours_price": false,
       "last_trade_time": "2024-05-29T16:00:00.000000"
     }
   ]
 }
 
*/

import Foundation

struct StockResponse: Codable {
    let data: [Stock]?
}

struct Stock: Codable, Identifiable {
    let id = UUID()
    let ticker: String?
    let name: String?
    let price: Double?
    let volume: Int?
}

struct Stock2: Codable, Identifiable {
    let id = UUID()
    let ticker: String?
    let name: String?
    let exchangeShort: String?
    let exchangeLong: String?
    let micCode: String?
    let currency: String?
    let price: Double?
    let dayHigh: Double?
    let dayLow: Double?
    let dayOpen: Double?
    let week52High: Double?
    let week52Low: Double?
    let marketCap: Double?
    let previousClosePrice: Double?
    let previousClosePriceTime: String?
    let dayChange: Double?
    let volume: Int?
    let isExtendedHoursPrice: Bool?
    let lastTradeTime: String?
    
    enum CodingKeys: String, CodingKey {
        case ticker
        case name
        case exchangeShort = "exchange_short"
        case exchangeLong = "exchange_long"
        case micCode = "mic_code"
        case currency
        case price
        case dayHigh = "day_high"
        case dayLow = "day_low"
        case dayOpen = "day_open"
        case week52High = "52_week_high"
        case week52Low = "52_week_low"
        case marketCap = "market_cap"
        case previousClosePrice = "previous_close_price"
        case previousClosePriceTime = "previous_close_price_time"
        case dayChange = "day_change"
        case volume
        case isExtendedHoursPrice = "is_extended_hours_price"
        case lastTradeTime = "last_trade_time"
    }
    init(ticker: String?, name: String?, exchangeShort: String?, exchangeLong: String?, micCode: String?, currency: String?, price: Double?, dayHigh: Double?, dayLow: Double?, dayOpen: Double?, week52High: Double?, week52Low: Double?, marketCap: Double?, previousClosePrice: Double?, previousClosePriceTime: String?, dayChange: Double?, volume: Int?, isExtendedHoursPrice: Bool?, lastTradeTime: String?) {
        self.ticker = ticker
        self.name = name
        self.exchangeShort = exchangeShort
        self.exchangeLong = exchangeLong
        self.micCode = micCode
        self.currency = currency
        self.price = price
        self.dayHigh = dayHigh
        self.dayLow = dayLow
        self.dayOpen = dayOpen
        self.week52High = week52High
        self.week52Low = week52Low
        self.marketCap = marketCap
        self.previousClosePrice = previousClosePrice
        self.previousClosePriceTime = previousClosePriceTime
        self.dayChange = dayChange
        self.volume = volume
        self.isExtendedHoursPrice = isExtendedHoursPrice
        self.lastTradeTime = lastTradeTime
    }
}
