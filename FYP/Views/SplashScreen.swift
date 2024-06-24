//
//  SplashScreen.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var size = 0.7
    @State private var opacity = 0.7
    
    var body: some View {
        VStack {
            Image(systemName: "dollarsign")
                .font(.system(size: 90))
                .foregroundColor(.cyan)
            Text("StockProphet")
        }
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeIn(duration: 1.5)) {
                self.size = 0.9
                self.opacity = 1.0
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isActive = true
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
