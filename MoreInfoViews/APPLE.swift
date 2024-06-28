//
//  APPLE.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct APPLE: View {
    
    //var stock: Stock
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                Text("Apple")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                GraphView()
                    .frame(height: 200)
                
                Text("Overview")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 10) {
                    DetailRow(title: "Name", value: "Apple Inc.")
                    DetailRow(title: "Ticker", value: "AAPL")
                    DetailRow(title: "Price", value: "$132.54")
                    DetailRow(title: "Volume", value: "28,654,321")
                }
                
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

struct DetailRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 100, alignment: .leading)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundColor(.white)
        }
    }
}

struct APPLE_Previews: PreviewProvider {
    static var previews: some View {
        APPLE()
    }
}
