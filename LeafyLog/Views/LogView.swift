//
//  LogView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseFirestoreSwift
import SwiftUI

// View displaying a list of log items for the user
// This view allows users to view, delete, and add new log items
struct LogView: View {
    
    // Set viewModel to LogViewVM
    @StateObject var viewModel: LogViewVM
    
    // Firestore query for fetching log items associated with the user
    @FirestoreQuery var items: [LogItem]
    
    // Initializes the view with the user id
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/logs")
        self._viewModel = StateObject(wrappedValue: LogViewVM(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    LogItemView(item: item)
                        .swipeActions {
                            // Swipe action to delete a log item
                            Button("Delete") {
                                // Delete item
                                viewModel.delete(id: item.id)
                            }.tint(Color.red)
                        }
                }.listStyle(PlainListStyle())
            }.navigationTitle("Your Logs")
                .toolbar {
                    // Button to present the view for creating a new log item
                    Button {
                        // Action
                        viewModel.showingNewLogItemView = true
                    } label: {
                        Image(systemName: "plus").foregroundColor(Color.green)
                    }
                }
                .sheet(isPresented: $viewModel.showingNewLogItemView) {
                    NewLogItemView(newLogPresented: $viewModel.showingNewLogItemView)
                }
        }
    }
}

#Preview {
    LogView(userId: "1E8pFRluxTRp961kBuqgEqz9zEB3")
}
