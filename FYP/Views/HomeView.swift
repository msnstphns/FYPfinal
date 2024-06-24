//
//  HomeView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = StockViewModel()
    
    var body: some View {
                List {
                    ForEach(Array(viewModel.stocks.enumerated()), id: \.element.id) { index, stock in
                        StockRowView(stock: stock, index: index + 1)
                    }
                }
        .padding()
        .task {
            await viewModel.getStocks()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
