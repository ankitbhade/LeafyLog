//
//  StatsViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/25/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class StatsViewVM: ObservableObject {
    @Published var totalEntries: Int = 0
    
    private let db = Firestore.firestore()
    
    func fetchStatistics() {
            guard let userId = Auth.auth().currentUser?.uid else { return }
            
            let journalCollection = db.collection("users").document(userId).collection("journal")
            
            // Fetch total number of journal entries
            journalCollection.getDocuments { [weak self] snapshot, error in
                guard let self = self else { return }
                if let snapshot = snapshot {
                    self.totalEntries = snapshot.documents.count
                    print("Total journal entries: \(self.totalEntries)") // Debugging
                }
            }
        }
}

