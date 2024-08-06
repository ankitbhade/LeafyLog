//
//  JournalViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import FirebaseFirestore
import Foundation

// ViewModel for managing journal entries in LeafyLog
// Responsible for the state and actions related to journal entries
class JournalViewVM: ObservableObject {
    
    // Indicates whether the view for creating a new journal entry is being shown
    @Published var showingNewJournalEntryView = false
    
    // Indicates whether the view for editing a journal entry is being shown
    @Published var showingEditJournalEntryView = false
    
    // Current user id
    private let userId: String
    
    // Initialize ViewModel with user id
    init(userId: String) {
        self.userId = userId
    }
    
    // Deletes a journal entry with the specified ID
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("journal").document(id).delete()
    }
}
