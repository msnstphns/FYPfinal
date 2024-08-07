//
//  StockAPIService.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import Foundation
import Combine

class StockAPIService {
    // the API can only call 3 stocks in the free version from StockData API, but in the URL below are examples of other tickers that can be used
    // api_token=X2YP8T4JHkLASc2vidWHtbtpfGij2SJj8DrFEtXL
    // API token included in URL
    
    let url = URL(string: "https://api.stockdata.org/v1/data/quote?symbols=MSFT,AAPL,NVDA,AMZN,META,GOOG,BRK.B,LLY,JPM,AVGO,XOM,UNH,V,TSLA,PG,MA,JNJ,HD,MRK,COST,ABBV,CVX,CRM,BAC,NFLX&api_token=X2YP8T4JHkLASc2vidWHtbtpfGij2SJj8DrFEtXL")
                  
    // function to retieve stocks from the API and decode them with JSON
    func fetchStocks() async -> [Stock] {
        let data = try? await URLSession.shared.data(from: url!)
        if let data = data {
            let stockResponse = try? JSONDecoder().decode((StockResponse.self), from: data.0)
            return stockResponse?.data ?? []
        } else {
            return []
        }
    }
}
