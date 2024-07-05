//
//  NewsAPIService.swift
//  NewsAPI
//
//  Created by Mason Stephens on 01/06/2024.
//

import Foundation
import Combine

class NewsAPIService {
    // apiKey=7d1b1c1d98e64991afec89687888190f included in URL
    
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7d1b1c1d98e64991afec89687888190f")
    
    // function for decoding JSON data
    func fetchNews() async -> [News] {
        let articles = try? await
        URLSession.shared.data(from: url!)
        if let articles = articles {
            let newsResponse = try?
            JSONDecoder().decode((NewsResponse.self), from: articles.0)
            return newsResponse?.articles ?? []
        } else {
            return []
        }
    }
}
