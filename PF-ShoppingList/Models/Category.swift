//
//  Category.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import SwiftUI

enum Category: String, CaseIterable, Codable, Identifiable {
    case milk = "Milk"
    case vegetables = "Vegetables"
    case fruits = "Fruits"
    case breads = "Breads"
    case meats = "Meats"
    case none = "None"

    var id: String { rawValue }

    var displayName: String { rawValue }

    var emoji: String {
        switch self {
        case .milk:       
            return "🥛"
        case .vegetables: 
            return "🥦"
        case .fruits:     
            return "🍎"
        case .breads:     
            return "🍞"
        case .meats:      
            return "🥩"
        case .none:
            return "🤔"
        }
    }

    var color: Color {
        switch self {
        case .milk:
            return Color(red: 0.53, green: 0.81, blue: 0.98)
        case .vegetables:
            return Color(red: 0.40, green: 0.80, blue: 0.40)
        case .fruits:
            return Color(red: 1.00, green: 0.55, blue: 0.30)
        case .breads:
            return Color(red: 0.91, green: 0.76, blue: 0.45)
        case .meats:
            return Color(red: 0.95, green: 0.40, blue: 0.50)
        case .none:
            return Color(red: 0.0, green: 0.0, blue: 0.0)
        }
    }
}
