//
//  LoginViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseAuth
import Foundation

// ViewModel for the login view in LeafyLog
// Responsible for managing user login and validation logic
class LoginViewVM: ObservableObject {
    
    // User email
    @Published var email = ""
    
    // User password
    @Published var password = ""
    
    // Error message if login/validation fails
    @Published var errorMessage = ""
    
    // Initialize ViewModel
    init() {
    }
    
    // Attempts to log in the user with the provided email and password
    func login() {
        guard validate() else {
            return
        }
        // Log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    // Validates the email and password
    private func validate() -> Bool {
        // reset error message on login button press
        errorMessage = ""
        // Make sure an email and password is entered, otherwise print error message and return/stop
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please Fill In All Fields."
            return false
        }
        // Make sure the provided email contains an @ and .
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please Enter A Valid Email Address."
            return false
        }
        return true
    }
}
