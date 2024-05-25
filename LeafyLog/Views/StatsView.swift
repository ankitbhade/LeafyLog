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
        VStack {
            Text("Statistics")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Form {
                Section(header: Text("Total Journal Entries")) {
                    Text("\(viewModel.totalEntries)")
                }
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
