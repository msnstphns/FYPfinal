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
        VStack {
            Text("StockProphet")
                .font(.title)
                .foregroundColor(.cyan)
                .bold()
                .padding(.top, 15)
            
            SearchBar(text: $viewModel.searchText)
                .padding(.top)
            
            List {
                ForEach(Array(viewModel.filteredStocks.enumerated()), id: \.element.id) { index, stock in
                    StockRowView(stock: stock, index: index + 1)
                }
            }
            .padding()
            .task {
                await viewModel.getStocks()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
