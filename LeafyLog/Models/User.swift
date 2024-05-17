//
//  User.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
