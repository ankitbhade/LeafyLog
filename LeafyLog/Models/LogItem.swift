//
//  LogItem.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import Foundation

struct LogItem: Codable, Identifiable {
    let id : String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
