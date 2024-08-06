//
//  ProfileViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for the ProfileView in LeafyLog
// Responsible for managing user profile data and authentication state
class ProfileViewVM: ObservableObject {
    
    // Current user's profile information
    @Published var user: User? = nil
    
    // Fetches the current user's profile data from Firestore
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", email: data["email"] as? String ?? "", joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    // Intialize ViewModel
    init() {
        
    }
    
    // Logs out current user
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
