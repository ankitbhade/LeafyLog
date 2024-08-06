//
//  EditJournalEntryViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import FirebaseFirestore
import Foundation

// ViewModel for editing an existing journal entry in LeafyLog
// Responsible for the state and logic for updating an existing journal entry
class EditJournalEntryViewVM: ObservableObject {
    
    // Title of journal entry
    @Published var title: String
    
    // Content of journal entry
    @Published var content: String
    
    // Indicates whether to show alert for journal entry
    @Published var showAlert = false
    
    // The journal entry being edited
    private let entry: JournalEntry
    
    // Initialize ViewModel with the specified journal entry
    init(entry: JournalEntry) {
        self.entry = entry
        self.title = entry.title
        self.content = entry.content
    }
    
    // Saves the changes to the journal entry in Firestore
    func save() {
        guard canSave else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(entry.userId).collection("journal").document(entry.id).updateData([
            "title": title,
            "content": content
        ])
    }
    
    // Boolean indicating whether the journal entry can be saved
    var canSave: Bool {
        return !title.trimmingCharacters(in: .whitespaces).isEmpty && !content.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
