//
//  LogItemViewVM.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// A single log item
class LogItemViewVM: ObservableObject {
    init() {
        
    }
    
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
