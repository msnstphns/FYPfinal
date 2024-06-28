//
//  NewsView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct NewsView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        
        VStack {
            Text("hello world")
            List {
                ForEach(viewModel.news) { news in
                    NewsRowView(news: news)
                }
            }
            .padding()
            .task {
                await viewModel.getNews()
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
