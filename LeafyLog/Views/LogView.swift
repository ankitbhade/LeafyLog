//
//  LogView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct LogView: View {
    
    @StateObject var viewModel: LogViewVM
    @FirestoreQuery var items: [LogItem]
    
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
                            Button("Delete") {
                                // Delete item
                                viewModel.delete(id: item.id)
                            }.tint(Color.red)
                        }
                }.listStyle(PlainListStyle())
            }.navigationTitle("Your Logs")
                .toolbar {
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
