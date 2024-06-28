//
//  NewsModel.swift
//  NewsAPI
//
//  Created by Mason Stephens on 01/06/2024.
//

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7d1b1c1d98e64991afec89687888190f

/*
 {
   "status": "ok",
   "totalResults": 69,
   "articles": [
     {
       "source": {
         "id": null,
         "name": "BBC News"
       },
       "author": null,
       "title": "Wordle locked in legal row with geography spinoff, Worldle - BBC.com",
       "description": "The New York Times, Wordle's owner, accuses similarly-named geography game of \"creating confusion.\"",
       "url": "https://www.bbc.com/news/articles/cjrr5ee5zv8o",
       "urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/50ac/live/15cb77b0-1dca-11ef-baa7-25d483663b8e.jpg",
       "publishedAt": "2024-05-31T09:22:44Z",
       "content": "Zoe Kleinman,Technology editor\r\nThe owner of the hit online game Wordle is legally challenging a geography-based spinoff called Worldle.\r\nIn the filing, the New York Times, which purchased Wordle for… [+3235 chars]"
     },
 */

import Foundation

struct NewsResponse: Codable {
    let articles: [News]?
}

struct News: Codable, Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let description: String
}


struct News1: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL?
    let publishedAt: String
    let content: String
}
