//
//  NewsViewModel.swift
//  NewsAPI
//
//  Created by Mason Stephens on 01/06/2024.
//

import Foundation
import Combine

@MainActor
class NewsViewModel: ObservableObject {
    
    @Published var news: [News] = []
    var api = NewsAPIService()
    
    func getNews() async {
        news = await api.fetchNews()
    }
}
