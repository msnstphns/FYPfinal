//
//  GraphView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI
import Charts

struct GraphView: View {
    @State private var stockData: [StockData] = []

    var body: some View {
        VStack {
            Text("Apple")
                .font(.largeTitle)
                .foregroundColor(.primary)
            
            // Adjusting the size of the Chart view
            Chart {
                ForEach(stockData) { data in
                    LineMark(
                        x: .value("Date", data.date),
                        y: .value("Close", data.close)
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .chartYScale(domain: 150...250) // Adjust the Y-axis scale if needed
            .padding()
            .onAppear {
                stockData = loadStockData()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
