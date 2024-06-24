//
//  StockGraphData.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import Foundation

struct StockData: Identifiable, Decodable {
    let id = UUID()
    let date: String
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let adjClose: Double
    let volume: Int
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case open = "Open"
        case high = "High"
        case low = "Low"
        case close = "Close"
        case adjClose = "Adj Close"
        case volume = "Volume"
    }
}

func loadStockData() -> [StockData] {
    guard let url = Bundle.main.url(forResource: "AAPL", withExtension: "json") else {
        fatalError("Failed to locate stockdata.json in bundle.")
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let stockData = try decoder.decode([StockData].self, from: data)
        return stockData
    } catch {
        fatalError("Failed to decode stockdata.json: \(error.localizedDescription)")
    }
}

