//
//  GraphData.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import Foundation

struct StockPrices: Identifiable {
    let id = UUID()
    let price: Double
    let month: String
}

extension StockPrices {
    static let StockSample: [StockPrices] = [
        .init(price: 50, month: "january"),
        .init(price: 100, month: "February"),
        .init(price: 500, month: "March"),
    ]
}
