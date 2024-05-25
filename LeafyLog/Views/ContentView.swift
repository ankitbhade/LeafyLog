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
