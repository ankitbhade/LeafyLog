//
//  JournalEntry.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import Foundation

// Model for a single journal entry in LeafyLog
struct JournalEntry: Codable, Identifiable {
    // Journal entry id
    let id: String
    // Journal entry title
    let title: String
    // Journal entry content
    let content: String
    // Journal entry creation date
    let createdDate: TimeInterval
    // User id of the user who created the journal entry
    let userId: String
    
    // Returns dictionary representation of a journal entry
    func asDictionary() -> [String: Any] {
        return ["id": id, "title": title, "content": content, "createdDate": createdDate, "userId": userId]
    }
}
