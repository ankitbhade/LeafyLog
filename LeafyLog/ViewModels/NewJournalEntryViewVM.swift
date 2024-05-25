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
    
    private let prompts = [
        "What made you smile today?",
        "What are you grateful for?",
        "Describe a recent challenge you faced and how you overcame it.",
        "What is something new you learned today?",
        "Reflect on a happy memory from your childhood."
    ]
    
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
    
    func selectRandomPrompt() {
        if let randomPrompt = prompts.randomElement() {
            content = randomPrompt
        }
    }
}

