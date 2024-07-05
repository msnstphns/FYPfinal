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
    @Published var searchText: String = ""
    
    var api = StockAPIService()
    
    func getStocks() async {
        stocks = await api.fetchStocks()
    }
    
    // search bar to filter stocks
    var filteredStocks: [Stock] {
            if searchText.isEmpty {
                return stocks
            } else {
                return stocks.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
            }
        }
}
