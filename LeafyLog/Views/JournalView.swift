//
//  JournalView.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import FirebaseFirestoreSwift
import SwiftUI

// A view that displays a list of journal entries for the user
// It allows users to view, delete, and edit journal entries
struct JournalView: View {
    
    // Set viewModel to JournalViewVM
    @StateObject var viewModel: JournalViewVM
    
    // Firestore query to fetch journal entries from the user's collection
    @FirestoreQuery var entries: [JournalEntry]
    
    // Selected journal entry for editing
    @State private var selectedEntry: JournalEntry? = nil
    
    // Initialize viewModel with the user's ID and setting up the Firestore query
    init(userId: String) {
        self._entries = FirestoreQuery(collectionPath: "users/\(userId)/journal")
        self._viewModel = StateObject(wrappedValue: JournalViewVM(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // List of journal entries
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
                    // Add new entry button
                    Button {
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
