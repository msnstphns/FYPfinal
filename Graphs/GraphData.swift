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


struct Workout: Identifiable {
    let id = UUID()
    let day: String
    let minutes: Int
}

extension Workout {
    static let walkWorkout: [Workout] = [
        .init(day: "Mon", minutes: 23),
        .init(day: "Tue", minutes: 35),
        .init(day: "Wed", minutes: 55),
        .init(day: "Thu", minutes: 30),
        .init(day: "Fri", minutes: 15),
        .init(day: "Sat", minutes: 65),
        .init(day: "Sun", minutes: 81),
    ]
}
