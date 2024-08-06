//
//  RegisterView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

// View for user registration
// This view allows users to create a new account by providing their name, email, and password
struct RegisterView: View {
    
    // Set viewModel to RegisterViewVM
    @StateObject var viewModel = RegisterViewVM()
    
    var body: some View {
        VStack {
            // Header
            LoginHeaderView(title: "Get Started!", subtitle: "Build Your Forest Today", angle: -15, background: Color.green)
            
            // Form
            Form {
                // Name
                TextField("Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                // Email
                TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                // Password
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                // Create Account
                LLButton(title: "Create Account", background: Color.green) {
                    // Register
                    viewModel.register()
                }
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
