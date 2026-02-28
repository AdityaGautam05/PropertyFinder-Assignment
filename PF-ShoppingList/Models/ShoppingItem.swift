//
//  ShoppingItem.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import Foundation
import SwiftData

@Model
final class ShoppingItem {
    var id: UUID
    var name: String
    var categoryRaw: String
    var isCompleted: Bool
    var dateAdded: Date

    var category: Category {
        get { Category(rawValue: categoryRaw) ?? .milk }
        set { categoryRaw = newValue.rawValue }
    }

    init(name: String, category: Category, isCompleted: Bool = false, dateAdded: Date = .now) {
        self.id = UUID()
        self.name = name
        self.categoryRaw = category.rawValue
        self.isCompleted = isCompleted
        self.dateAdded = dateAdded
    }
}
