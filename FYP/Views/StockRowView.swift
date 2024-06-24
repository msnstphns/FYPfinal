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
                    .frame(width: 30, alignment: .leading) // Adjust width as needed
                    .padding(.leading, 1) // Add padding if necessary
                
                Spacer()
                
                Text("\(stock.name ?? "")")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                Text("Current price: £\(String(format: "%.2f", stock.price ?? 0))")
                    .frame(width: 150, alignment: .trailing) // Adjust width as needed
                    .padding(.trailing, 10) // Add padding if necessary
            }
            .padding(.vertical, 8) // Adjust vertical padding as needed
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
