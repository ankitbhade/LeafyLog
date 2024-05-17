//
//  LeafyLogApp.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//
import FirebaseCore
import SwiftUI

@main
struct LeafyLogApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
