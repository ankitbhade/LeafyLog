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
    
    // Configure Firebase
    init() {
        FirebaseApp.configure()
    }
    
    // Main ContentView for App
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
