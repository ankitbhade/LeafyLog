//
//  EditJournalEntryViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import FirebaseFirestore
import Foundation

class EditJournalEntryViewVM: ObservableObject {
    @Published var title: String
    @Published var content: String
    @Published var showAlert = false
    
    private let entry: JournalEntry
    
    init(entry: JournalEntry) {
        self.entry = entry
        self.title = entry.title
        self.content = entry.content
    }
    
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
        
    var canSave: Bool {
        return !title.trimmingCharacters(in: .whitespaces).isEmpty && !content.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
