//
//  ContentView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

// The main view of the LeafyLog app
// This view displays either the login screen or the account dashboard based on the user's authentication state
struct ContentView: View {
    
    // Set viewModel to ContentViewVM
    @StateObject var viewModel = ContentViewVM()
    
    var body: some View {
        // Conditional view based on the user's sign in state
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        }
        else {
            LoginView()
        }
    }
    
    // The main account view displayed when the user is signed in
    @ViewBuilder
    var accountView: some View {
        TabView {
            LogView(userId: viewModel.currentUserId).tabItem {
                Label("Logs", systemImage: "list.bullet")
            }
            JournalView(userId: viewModel.currentUserId).tabItem {
                Label("Journal", systemImage: "book")
            }
            StatsView().tabItem {
                Label("Stats", systemImage: "chart.bar")
            }
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }.accentColor(Color.green)
    }
}

#Preview {
    ContentView()
}
