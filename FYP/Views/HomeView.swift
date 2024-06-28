//
//  HomeView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = StockViewModel()
    @State private var selectedStock: Stock?

    var body: some View {
        NavigationView {
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
                        NavigationLink(destination: APPLE()) {
                            StockRowView(stock: stock, index: index + 1)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowInsets(EdgeInsets())
                        .background(Color.clear)
                    }
                }
                .padding()
                .task {
                    await viewModel.getStocks()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
