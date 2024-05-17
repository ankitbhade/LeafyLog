//
//  RegisterView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewVM()
    
    var body: some View {
        VStack {
            // Header
            LoginHeaderView(title: "Get Started!", subtitle: "Build Your Forest Today", angle: -15, background: Color.green)
            
            // Form
            Form {
                TextField("Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                
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
