//
//  LogItemViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for managing a single log item in LeafyLog
// Responsible for toggling the completion status of a log item
class LogItemViewVM: ObservableObject {
    
    // Initialize ViewModel
    init() {
        
    }
    
    // Toggles the completion status of the given log item and updates it in Firestore
    func toggleIsDone(item: LogItem) {
        var copyItem = item
        copyItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("logs").document(copyItem.id).setData(copyItem.asDictionary())
    }
}
