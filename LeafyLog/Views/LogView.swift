//
//  LogView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct LogView: View {
    
    @StateObject var viewModel = LogViewVM()
    @FirestoreQuery var items: [LogItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/logs")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    LogItemView(item: item)
                        .swipeActions {
                            Button {
                                // Delete item
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete").foregroundColor(Color.red)
                            }
                        }
                }.listStyle(PlainListStyle())
            }.navigationTitle("Your Logs")
                .toolbar {
                    Button {
                        // Action
                        viewModel.showingNewLogItemView = true
                    } label: {
                        Image(systemName: "plus")
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
