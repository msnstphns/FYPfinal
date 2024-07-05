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
                // display 3 variables from the API, title, author, description
                Text(news.title ?? "")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(news.author ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(news.description ?? "")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(4) // Limit to 2 lines for the description so it doesn't look overcrowded
            }
            .padding(.vertical, 10)
            
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.cyan.opacity(0.3))
        .cornerRadius(10) // corner radius for rounded edges for a smoother look
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}


struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleNews = News(title: "News Title", author: "Jack Smith", description: "Lorem ipsum dolor sit amet, adipiscing elit.")
        
        return NewsRowView(news: sampleNews)
            .previewLayout(.fixed(width: 350, height: 100)) // Adjust preview size as required
            .padding()
    }
}
