//
//  JournalViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import FirebaseFirestore
import Foundation

class JournalViewVM: ObservableObject {
    
    @Published var showingNewJournalEntryView = false
    @Published var showingEditJournalEntryView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("journal").document(id).delete()
    }
}
