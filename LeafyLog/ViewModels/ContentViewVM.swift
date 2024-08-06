//
//  ContentViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseAuth
import Foundation

// ViewModel for the ContentView in LeafyLog
// Responsible for managing user authentication state
class ContentViewVM: ObservableObject {
    
    // The current user id
    @Published var currentUserId: String = ""
    
    // The handle for the authentication state listener
    private var handler: AuthStateDidChangeListenerHandle?
   
    // Initializes the ViewModel and sets up the authentication state listener
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    // Boolean indicating whether the user is signed in
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
