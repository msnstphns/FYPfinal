//
//  PredictionsView.swift
//  FYP
//
//  Created by Mason Stephens on 28/06/2024.
//

import SwiftUI
import Charts

struct PredictionsView: View {
    @State private var selectedDays: Int = 7
    @State private var stockSymbol: String = "AAPL"
    @State private var stockData: [Double] = []
    @State private var percentageChange: Double = 0.0
    
    let daysOptions = [7, 14, 21, 28]
    let stockSymbols = ["AAPL", "NVIDIA", "MSFT"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Stock Selection")) {
                        Picker("Select Stock", selection: $stockSymbol) {
                            ForEach(stockSymbols, id: \.self) { symbol in
                                Text(symbol)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Prediction Days")) {
                        Picker("Select Days", selection: $selectedDays) {
                            ForEach(daysOptions, id: \.self) { days in
                                Text("\(days) days")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Button(action: fetchPredictions) {
                    Text("Fetch Predictions")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                // Percentage Change Section
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
                    Text("No Data Available")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("Predictions")
        }
    }
    
    func fetchPredictions() {
        // Mock data for demonstration. Replace this with actual data fetching logic.
        stockData = (1...selectedDays).map { _ in Double.random(in: 100...500) }
        
        // Calculate percentage change
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

