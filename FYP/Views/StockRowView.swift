//
//  StockRowView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct StockRowView: View {
    
    var stock: Stock
    var index: Int
    
    var body: some View {
        HStack {
            Text("\(index)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(width: 30, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text(stock.name ?? "")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("Current price: £\(String(format: "%.2f", stock.price ?? 0))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(8)
        .shadow(radius: 2)
        .padding(.vertical, 4)
    }
}

struct StockRowView_Previews: PreviewProvider {
    static var previews: some View {
        StockRowView(stock: Stock(ticker: "AAPL", name: "Apple", price: 150.0, volume: 200), index: 1)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}



//#Preview {
//    StockRowView(stock: (Stock(ticker: nil, name: "Apple", exchangeShort: nil, exchangeLong: nil, micCode: nil, currency: nil, price: 500, dayHigh: nil, dayLow: nil, dayOpen: nil, week52High: nil, week52Low: nil, marketCap: nil, previousClosePrice: nil, previousClosePriceTime: nil, dayChange: nil, volume: nil, isExtendedHoursPrice: nil, lastTradeTime: nil)))
//}

/*struct StockRowView_Previews: PreviewProvider {
    static var previews: some View {
        StockRowView()
    }
}*/
