//
//  ItemRowView.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import SwiftUI

struct ItemRowView: View {
    let item: ShoppingItem
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            // Completion toggle
            Button(action: onToggle) {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundStyle(item.isCompleted ? item.category.color : .secondary)
                    .animation(.easeInOut(duration: 0.2), value: item.isCompleted)
            }
            .buttonStyle(.plain)

            // Item name
            Text(item.name)
                .font(.body)
                .strikethrough(item.isCompleted, color: .secondary)
                .foregroundStyle(item.isCompleted ? .secondary : .primary)
                .animation(.easeInOut(duration: 0.2), value: item.isCompleted)

            Spacer()

            // Category badge
            HStack(spacing: 3) {
                Text(item.category.emoji)
                Text(item.category.displayName)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(item.category.color.opacity(0.18))
            .foregroundStyle(item.category.color)
            .clipShape(Capsule())
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    let item = ShoppingItem(name: "Whole Milk", category: .milk)
    ItemRowView(item: item, onToggle: {})
        .padding()
}
