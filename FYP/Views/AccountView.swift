//
//  AccountView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI

struct AccountView: View {
    @State private var emailAddress = "example@example.com"
    @State private var selectedPlan = StockPredictionPlan.free
    
    enum StockPredictionPlan: String, CaseIterable {
        case free = "Free Version"
        case monthlyPaid = "Monthly Paid Version"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Email Address Section
            Section(header: Text("Email Address")) {
                Text(emailAddress)
                    .font(.headline)
            }
            
            // Stock Prediction Plan Section
            Section(header: Text("Stock Price Prediction Plan")) {
                Picker("Select Plan", selection: $selectedPlan) {
                    ForEach(StockPredictionPlan.allCases, id: \.self) { plan in
                        Text(plan.rawValue)
                            .tag(plan)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            // Change Password Section
            Section {
                Button(action: {
                    changePassword()
                }) {
                    Text("Change Password")
                        .foregroundColor(.blue)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Account Settings")
    }
    
    private func changePassword() {
        // Implement password change logic here
        print("Changing password...")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountView()
        }
    }
}

