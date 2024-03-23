//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import SwiftUI
import FirebaseCore
@main
struct ToDoListAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
