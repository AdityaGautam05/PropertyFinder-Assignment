//
//  PF_ShoppingListApp.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import SwiftUI
import SwiftData

@main
struct PF_ShoppingListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ShoppingItem.self)
    }
}
