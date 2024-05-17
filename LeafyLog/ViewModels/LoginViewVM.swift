//
//  LoginViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseAuth
import Foundation

class LoginViewVM: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login() {
        guard validate() else {
            return
        }
        // Log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
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
