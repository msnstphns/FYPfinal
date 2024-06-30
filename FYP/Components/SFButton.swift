//
//  SFButton.swift
//  FYP
//
//  Created by Mason Stephens on 30/06/2024.
//

import SwiftUI

struct SFButton: View {
    
    let SFButton: String
    
    var body: some View {
        Image(systemName: SFButton)
            .font(.headline)
            .foregroundColor(Color.black)
            .frame(width: 30, height: 30)
            .background(Circle().foregroundColor(Color.gray)
            )
            .shadow(
                color: Color.cyan.opacity(0.25),
                radius: 10, x:0, y: 0)
            .padding()
        
    }
}

struct SFButton_Previews: PreviewProvider {
    static var previews: some View {
        SFButton(SFButton: "info")
    }
}
