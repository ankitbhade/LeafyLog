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
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile ...")
                }
            }.navigationTitle("Your Profile")
        } .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Image
        Image(systemName: "person.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.green).frame(width: 125, height: 125)
            .padding()
        // Information
        VStack(alignment: .leading) {
            HStack {
                Text("Name:").bold()
                Text(user.name)
            }.padding()
            HStack {
                Text("Email:").bold()
                Text(user.email)
            }.padding()
            HStack {
                Text("Member Since:").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }
        .padding()
        // Log out
        Button("Log Out") {
            viewModel.logOut()
        }.tint(.red)
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
