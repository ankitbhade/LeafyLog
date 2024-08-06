//
//  StatsView.swift
//  LeafyLog
//
//  Created by Ankit on 5/25/24.
//

import SwiftUI

// A view displaying stats related to the user's journal entries and logs, along with a rotating quote feed
struct StatsView: View {
    
    // Set viewModel to StatsViewVM
    @StateObject var viewModel = StatsViewVM()
    
    var body: some View {
        ZStack {
            // Background image
            Image("leafyhome")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                // Title
                Spacer().frame(height: 60)
                Text("Leafy Stats")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                // Subtitle
                Text("Your Activity Summary")
                    .foregroundColor(Color.white)
                    .font(.subheadline)
                // Stats form
                Form {
                    // Section for total journal entries
                    Section(header: Text("Total Journal Entries")) {
                        Text("\(viewModel.totalEntries)")
                    }
                    // Section for total completed logs
                    Section(header: Text("Total Completed Logs")) {
                        Text("\(viewModel.completedLogs)")
                    }
                    // Section for rotating quotes feed
                    Section(header: Text("River of Quotes")) {
                        Text("\(viewModel.currentQuote)")
                        .italic()
                    }
                }
                .cornerRadius(30)
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchStatistics()
        }
    }
}

#Preview {
    StatsView()
}
