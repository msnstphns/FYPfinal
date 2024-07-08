//
//  LoginView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import SwiftUI
import FirebaseAuth

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginError: String?
    @Published var isLoggedIn: Bool = false
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            loginError = "Please enter both email and password."
            return
        }
        
        Task {
                do {
                    let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
                    // print to terminal for testing
                    print("User successfully logged in")
                    loginError = nil
                    isLoggedIn = true // update state to reflect successful login
                } catch let error as NSError {
                    // print to terminal for testing
                    print("Login error: \(error.localizedDescription)")
                    if let authErrorCode = AuthErrorCode.Code(rawValue: error.code) {
                        switch authErrorCode {
                        case .userNotFound:
                            loginError = "No user found with this email."
                        default:
                            loginError = error.localizedDescription
                        }
                    } else {
                        loginError = "An unknown error occurred."
                    }
                    isLoggedIn = false // ensure the state reflects unsuccessful login
                }
            }
        }
}

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                if let loginError = viewModel.loginError {
                    Text(loginError)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .padding(.bottom, 20)
                
                NavigationLink(
                    destination: SignUpView()
                        .navigationBarBackButtonHidden(true)
                ) {
                    Text("Don't have an account yet? Click here to sign up!")
                        .padding()
                        .foregroundColor(.blue)
                        .bold()
                }
                
                // navigationLink to HomeView
                NavigationLink(
                    destination: TabsView()
                        .navigationBarBackButtonHidden(true), // hide the back button in HomeView
                    isActive: $viewModel.isLoggedIn,
                    label: { EmptyView() }
                ).hidden()
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

