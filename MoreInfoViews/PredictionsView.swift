//
//  PredictionsView.swift
//  FYP
//
//  Created by Mason Stephens on 28/06/2024.
//

import SwiftUI
import Charts

struct PredictionsView: View {
    
    // empty variables so nothing is pre-selected for the user
    @State private var selectedDays: Int = 0
    @State private var stockSymbol: String = ""
    @State private var stockData: [Double] = []
    @State private var percentageChange: Double = 0.0
    
    // stock options in days and 3 stocks to choose from
    let daysOptions = [7, 14, 21, 28]
    let stockSymbols = ["AAPL", "NVIDIA", "MSFT"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // user can select the stock here
                    Section(header: Text("Stock Selection")) {
                        Picker("Select Stock", selection: $stockSymbol) {
                            ForEach(stockSymbols, id: \.self) { symbol in
                                Text(symbol)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    // user can select the amount of days to forecast ahead here
                    Section(header: Text("Prediction Days")) {
                        Picker("Select Days", selection: $selectedDays) {
                            ForEach(daysOptions, id: \.self) { days in
                                Text("\(days) days")
                            }}
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                // button to fetch predictions
                Button(action: fetchPredictions) {
                    Text("Fetch Predictions")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                // Percentage Change Section. green = positive change, red = negative change
                if percentageChange != 0.0 {
                    VStack {
                        Text("Percentage Change:")
                            .font(.headline)
                            .padding(.bottom, 4)
                        
                        Text("\(percentageChange, specifier: "%.2f")%")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(percentageChange >= 0 ? .green : .red)
                    }
                    .padding()
                }
                
                // Stock Price Chart Section
                if !stockData.isEmpty {
                    StockPriceChart(data: stockData, days: selectedDays)
                        .padding()
                } else {
                    Text("Select a stock and the days to forecast")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("Predictions")
        }
    }
    
    func fetchPredictions() {
        // fake data to show how to the graph would look using random number generation
        stockData = (1...selectedDays).map { _ in Double.random(in: 100...500) }
        
        // Calculate the percentage change here
        if let firstPrice = stockData.first, let lastPrice = stockData.last {
            percentageChange = ((lastPrice - firstPrice) / firstPrice) * 100.0
        } else {
            percentageChange = 0.0
        }
    }
}

struct StockPriceChart: View {
    var data: [Double]
    var days: Int
    
    var body: some View {
        Chart {
            ForEach(data.indices, id: \.self) { index in
                LineMark(
                    x: .value("Day", index + 1),
                    y: .value("Price", data[index])
                )
            }
        }
        .chartYScale(domain: 0...data.max()!)
        .padding()
    }
}

struct PredictionsView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionsView()
    }
}

