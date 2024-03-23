//
//  ToDoListViewViewModle.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import Foundation
import FirebaseFirestore


class ToDoListViewViewModle: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
