//
//  SearchBar.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
        
        var body: some View {

            HStack {
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if !text.isEmpty {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
            }
        }
    }


struct SearchBar_Previews: PreviewProvider {
    @State static var text = "Enter the stock to search"
    
    static var previews: some View {
        SearchBar(text: $text)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
