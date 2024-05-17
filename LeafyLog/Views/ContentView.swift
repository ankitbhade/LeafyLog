//
//  ContentView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewVM()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        }
        else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            LogView(userId: viewModel.currentUserId).tabItem {
                Label("Home", systemImage: "house")
            }
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    ContentView()
}
