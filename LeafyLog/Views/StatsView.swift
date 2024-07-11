//
//  StatsView.swift
//  LeafyLog
//
//  Created by Ankit on 5/25/24.
//

import SwiftUI

struct StatsView: View {
    @StateObject var viewModel = StatsViewVM()
    
    var body: some View {
        ZStack {
            Image("leafyhome")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer().frame(height: 60)
                Text("Leafy Stats")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                
                Text("Your Activity Summary")
                    .foregroundColor(Color.white)
                    .font(.subheadline)
                
                Form {
                    Section(header: Text("Total Journal Entries")) {
                        Text("\(viewModel.totalEntries)")
                    }
                    Section(header: Text("Total Completed Logs")) {
                        Text("\(viewModel.completedLogs)")
                    }
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
