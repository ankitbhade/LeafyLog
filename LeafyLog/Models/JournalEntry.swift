//
//  JournalEntry.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import Foundation

struct JournalEntry: Codable, Identifiable {
    let id: String
    let title: String
    let content: String
    let createdDate: TimeInterval
    let userId: String
    
    func asDictionary() -> [String: Any] {
        return ["id": id, "title": title, "content": content, "createdDate": createdDate, "userId": userId]
    }
}
