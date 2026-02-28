//
//  ShoppingListViewModel.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import Foundation
import SwiftData
import Observation

@Observable
final class ShoppingListViewModel {
    var selectedFilter: Category? = nil

    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    // MARK: - Filtered Items

    func filteredItems(_ items: [ShoppingItem]) -> [ShoppingItem] {
        guard let filter = selectedFilter else { return items }
        return items.filter { $0.category == filter }
    }

    // MARK: - CRUD

    func addItem(name: String, category: Category) {
        let item = ShoppingItem(name: name, category: category)
        modelContext.insert(item)
        try? modelContext.save()
    }

    func deleteItem(_ item: ShoppingItem) {
        modelContext.delete(item)
        try? modelContext.save()
    }

    func deleteItems(at offsets: IndexSet, from items: [ShoppingItem]) {
        for index in offsets {
            modelContext.delete(items[index])
        }
        try? modelContext.save()
    }

    func toggleCompleted(_ item: ShoppingItem) {
        item.isCompleted.toggle()
        try? modelContext.save()
    }

    func updateItem(_ item: ShoppingItem, name: String, category: Category) {
        item.name = name
        item.category = category
        try? modelContext.save()
    }
}
