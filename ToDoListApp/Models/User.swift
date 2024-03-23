//
//  User.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import Foundation
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
