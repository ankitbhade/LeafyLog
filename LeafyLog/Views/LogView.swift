//
//  LogView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

struct LogView: View {
    
    @StateObject var viewModel = LogViewVM()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("Your Logs")
                .toolbar {
                    Button {
                        // Action
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
    }
}

#Preview {
    LogView(userId: "")
}
