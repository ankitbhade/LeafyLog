//
//  NewLogItemVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewLogItemViewVM: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save() {
        // Make sure we can save to the database
        guard canSave else {
            return
        }
        
        // Get current user ID
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let newId = UUID().uuidString
        let newLogItem = LogItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // Save Model
        print("SAVING NEW LOG")
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("logs").document(newId).setData(newLogItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
