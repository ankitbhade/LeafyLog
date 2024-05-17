//
//  ProfileView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewVM()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("Your Profile")
        }
    }
}

#Preview {
    ProfileView()
}
