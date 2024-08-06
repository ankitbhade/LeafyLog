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

// ViewModel for displaying statistics and motivational quotes in LeafyLog
// Responsible for fetching user stats and cycling through motivational quotes
class StatsViewVM: ObservableObject {
    
    // The total number of journal entries for the current user
    @Published var totalEntries: Int = 0
    
    // The total number of completed logs for the current user
    @Published var completedLogs: Int = 0
    
    // The current motivational quote being displayed
    @Published var currentQuote: String = ""
    
    // A list of motivational quotes to be displayed
    private var quotes = [
        "The best way to get started is to quit talking and begin doing.",
        "The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.",
        "Don't let yesterday take up too much of today.",
        "You learn more from failure than from success. Don’t let it stop you. Failure builds character."
        // Can add more if needed
    ]
    
    // A set to store Combine cancellables for managing subscriptions
    private var cancellables = Set<AnyCancellable>()
    
    // Firestore database instance used for fetching data
    private let db = Firestore.firestore()
    
    // Fetches statistics related to journal entries and completed logs from Firestore
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
        
            // Cycle through quotes
            cycleQuotes()
        }
    
    // Starts a timer that cycles through the list of motivational quotes every 10 seconds
    func cycleQuotes() {
        Timer.publish(every: 10, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.currentQuote = self.quotes.randomElement() ?? ""
            }
            .store(in: &cancellables)
    }
}

