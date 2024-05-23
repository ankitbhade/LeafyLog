//
//  NewJournalEntryViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewJournalEntryViewVM: ObservableObject {
    
    @Published var title = ""
    @Published var content = ""
    @Published var showAlert = false
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newJournalEntry = JournalEntry(id: newId, title: title, content: content, createdDate: Date().timeIntervalSince1970, userId: userId)
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("journal").document(newId).setData(newJournalEntry.asDictionary())
    }
    
    var canSave: Bool {
        return !title.trimmingCharacters(in: .whitespaces).isEmpty && !content.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

