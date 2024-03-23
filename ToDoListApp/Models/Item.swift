//
//  Item.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
