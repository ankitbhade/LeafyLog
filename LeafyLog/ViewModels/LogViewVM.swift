//
//  LogViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseFirestore
import Foundation

// ViewModel for the main "Your Logs" tab in LeafyLog
// Responsible for managing log items and their states
class LogViewVM: ObservableObject {
    
    // Indicates whether new log item view is being shown
    @Published var showingNewLogItemView = false
    
    // Current user id
    private let userId: String
    
    // Initializes the ViewModel with the specified user id
    init(userId: String) {
        self.userId = userId
    }
    
    // Deletes a log item with the specified id
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("logs").document(id).delete()
    }
}
