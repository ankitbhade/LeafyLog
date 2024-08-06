//
//  NewJournalEntryViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for creating a new journal entry in LeafyLog
// Responsible for the state and logic for creating and saving new journal entries
class NewJournalEntryViewVM: ObservableObject {
    
    // Title of new journal entry
    @Published var title = ""
    
    // Content of new journal entry
    @Published var content = ""
    
    // Indicates whether to show alert for new journal entry
    @Published var showAlert = false
    
    // Date of new journal entry
    @Published var selectedDate = Date() // Add selectedDate property
    
    // A list of prompts to help users get started with their journal entry
    private let prompts = [
        "What made you smile today?",
        "What are you grateful for?",
        "Describe a recent challenge you faced and how you overcame it.",
        "What is something new you learned today?",
        "Reflect on a happy memory from your childhood."
    ]
    
    // Saves the new journal entry to Firestore
    func save() {
        guard canSave else {
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newJournalEntry = JournalEntry(id: newId, title: title, content: content, createdDate: selectedDate.timeIntervalSince1970, userId: userId)
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("journal").document(newId).setData(newJournalEntry.asDictionary())
    }
    
    // Boolean indicating whether the journal entry can be saved
    var canSave: Bool {
        return !title.trimmingCharacters(in: .whitespaces).isEmpty && !content.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    // Selects a random prompt from the predefined list and sets it as the content
    func selectRandomPrompt() {
        if let randomPrompt = prompts.randomElement() {
            content = randomPrompt
        }
    }
}

