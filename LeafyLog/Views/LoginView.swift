//
//  LoginView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

// View for user login
// This view allows users to enter their email and password to log in to the app
struct LoginView: View {
    
    // Set viewModel to LoginViewVM
    @StateObject var viewModel = LoginViewVM()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                LoginHeaderView(title: "Leafy Log", subtitle: "Stay Rooted With Your Personal Forest", angle: -15, background: Color.green)
                
                // Form
                Form {
                    // Error message
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    // Email and Password input fields
                    TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    // Login button
                    LLButton(title: "Login", background: Color.green) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                // Navigation to registration view
                // Create Account
                VStack {
                    Text("Don't have an account?")
                        .padding(.bottom, 10)
                    NavigationLink("Create An Account", destination: RegisterView())
                    .padding(.bottom, 10)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
