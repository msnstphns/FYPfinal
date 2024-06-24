//
//  StockViewModel.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import Foundation
import Combine

@MainActor
class StockViewModel: ObservableObject {
    
    @Published var stocks: [Stock] = []
    var api = StockAPIService()
    
    func getStocks() async {
        stocks = await api.fetchStocks()
    }
}
