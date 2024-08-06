//
//  RegisterViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

// ViewModel for the registration view in LeafyLog
// Responsible for managing user registration and validation logic
class RegisterViewVM: ObservableObject {
    
    // User name
    @Published var name = ""
    
    // User email
    @Published var email = ""
    
    // User password
    @Published var password = ""
    
    // Initialize ViewModel
    init() {
    }
    
    // Registers a new user with Firebase Auth
    func register() {
        guard validate() else {
            return
        }
        // Register user
        Auth.auth().createUser(withEmail: email, password: password) {
            [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    // Inserts a new user record into Firestore with id of new user
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    // Validates the user input for registration
    private func validate() -> Bool {
        // Make sure an name, email and password is entered, otherwise print error message and return/stop
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        // Make sure the provided email contains an @ and .
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        // Make sure password is long enough
        guard password.count >= 6 else {
            return false
        }
        return true
    }
}
