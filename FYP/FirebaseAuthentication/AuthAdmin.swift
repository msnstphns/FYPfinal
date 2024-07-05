//
//  AuthAdmin.swift
//  FYP
//
//  Created by Mason Stephens on 30/06/2024.
//

// Firebase SKD
// Managing accounts

/*import Foundation
import Firebase

struct authResultModel {
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}

final class AuthAdmin {
    
    static let share = AuthAdmin()
    private init() {}
    
    func retrieveAuthUser() throws -> authResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return authResultModel(user: user)
    }
    
    func createNewUser(email: String, password: String) async throws -> authResultModel {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return authResultModel(user: authResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
*/
