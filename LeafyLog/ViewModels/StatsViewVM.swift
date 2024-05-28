//
//  StatsViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/25/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation
import Combine

class StatsViewVM: ObservableObject {
    @Published var totalEntries: Int = 0
    @Published var completedLogs: Int = 0
    @Published var currentQuote: String = ""
    
    private var quotes = [
        "The best way to get started is to quit talking and begin doing.",
        "The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.",
        "Don't let yesterday take up too much of today.",
        "You learn more from failure than from success. Don’t let it stop you. Failure builds character."
    ]
    
    private var cancellables = Set<AnyCancellable>()
    
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
        
            let logsCollection = db.collection("users").document(userId).collection("logs")
        
            // Fetch total number of completed logs
            logsCollection.whereField("isDone", isEqualTo: true).getDocuments { [weak self] snapshot, error in
                guard let self = self else { return }
                if let snapshot = snapshot {
                    self.completedLogs = snapshot.documents.count
                    print("Total completed logs: \(self.completedLogs)") // Debugging
                } else if let error = error {
                    print("Error fetching completed logs: \(error.localizedDescription)")
                }
            }

            cycleQuotes()
        }
    
    func cycleQuotes() {
        Timer.publish(every: 10, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.currentQuote = self.quotes.randomElement() ?? ""
            }
            .store(in: &cancellables)
    }
}

