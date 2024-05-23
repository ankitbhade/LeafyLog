//
//  JournalView.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct JournalView: View {
    
    @StateObject var viewModel: JournalViewVM
    @FirestoreQuery var entries: [JournalEntry]
    
    @State private var selectedEntry: JournalEntry? = nil
    
    init(userId: String) {
        self._entries = FirestoreQuery(collectionPath: "users/\(userId)/journal")
        self._viewModel = StateObject(wrappedValue: JournalViewVM(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(entries) { entry in
                    JournalEntryView(entry: entry)
                        .swipeActions {
                            Button("Delete") {
                                // Delete entry
                                viewModel.delete(id: entry.id)
                            }.tint(Color.red)
                            Button("Edit") {
                                // Edit entry
                                selectedEntry = entry
                                viewModel.showingEditJournalEntryView = true
                            }.tint(Color.green)
                        }
                }.listStyle(PlainListStyle())
            }.navigationTitle("Your Journal")
                .toolbar {
                    Button {
                        // Action
                        viewModel.showingNewJournalEntryView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewJournalEntryView) {
                    NewJournalEntryView(newJournalPresented: $viewModel.showingNewJournalEntryView)
                }
                .sheet(item: $selectedEntry) { entry in
                    EditJournalEntryView(entry: entry, isPresented: $viewModel.showingEditJournalEntryView)
                }
        }
    }
}

#Preview {
    JournalView(userId: "1E8pFRluxTRp961kBuqgEqz9zEB3")
}
