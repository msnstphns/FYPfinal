//
//  LegalView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct LegalView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Disclaimer")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
                .foregroundColor(.white)
            
            Text("StockProphet provides stock predictions using machine learning algorithms and does not offer investment advice.")
                .foregroundColor(.white)
            
            Text("Your capital is always at risk with any investment. Use this app as a tool, not as the sole basis for your investment decisions.")
                .foregroundColor(.white)
            
            Text("Always conduct your own research and consult a financial advisor before investing. Past performance is not indicative of future results.")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.black)
        .navigationTitle("Legal Disclaimer")
    }
}

struct LegalView_Previews: PreviewProvider {
    static var previews: some View {
        LegalView()
    }
}
