//
//  LogItem.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import Foundation

// Model for a single log item in LeafyLog
struct LogItem: Codable, Identifiable {
    // Log id
    let id : String
    // Log title
    let title: String
    // Log due date
    let dueDate: TimeInterval
    // Log creation date
    let createdDate: TimeInterval
    // Log status
    var isDone: Bool
    
    // Function to set the log status
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
