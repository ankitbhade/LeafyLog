//
//  User.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import Foundation

// Model for a user in LeafyLog
struct User: Codable {
    // User id
    let id: String
    // User name
    let name: String
    // User email
    let email: String
    // User join time
    let joined: TimeInterval
}
