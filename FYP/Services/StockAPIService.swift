//
//  StockAPIService.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import Foundation
import Combine

class StockAPIService {
    let url = URL(string: "https://api.stockdata.org/v1/data/quote?symbols=MSFT,AAPL,NVDA,AMZN,META,GOOG,BRK.B,LLY,JPM,AVGO,XOM,UNH,V,TSLA,PG,MA,JNJ,HD,MRK,COST,ABBV,CVX,CRM,BAC,NFLX&api_token=X2YP8T4JHkLASc2vidWHtbtpfGij2SJj8DrFEtXL")
                  
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
