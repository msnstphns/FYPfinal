//
//  NewsRowView.swift
//  NewsAPI
//
//  Created by Mason Stephens on 01/06/2024.
//

import SwiftUI

struct NewsRowView: View {
    var news: News
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(news.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("By \(news.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(news.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(2) // Limit to 2 lines for description
            }
            .padding(.vertical, 10)
            
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.white) // Optional: Add background color
        .cornerRadius(10) // Optional: Add corner radius for rounded corners
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2) // Optional: Add shadow for depth
    }
}


struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleNews = News(title: "News Title", author: "Jack Smith", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        
        return NewsRowView(news: sampleNews)
            .previewLayout(.fixed(width: 350, height: 100)) // Adjust preview size as needed
            .padding()
    }
}
