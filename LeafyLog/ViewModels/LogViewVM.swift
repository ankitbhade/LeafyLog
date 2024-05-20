//
//  LogViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseFirestore
import Foundation

// The main 'Your Logs' Tab
class LogViewVM: ObservableObject {
    
    @Published var showingNewLogItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("logs").document(id).delete()
    }
}
