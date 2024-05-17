//
//  LoginView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewVM()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                LoginHeaderView(title: "Leafy Log", subtitle: "Stay Rooted With Your Personal Forest", angle: -15, background: Color.green)
                
                // Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    
                    LLButton(title: "Login", background: Color.green) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                
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
