//
//  ToDoListItemViewViewModle.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModle: ObservableObject {
    init() {}
    
    func toggleIsDone(item: Item) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
