//
//  EmptyStateView.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import SwiftUI

struct EmptyStateView: View {
    let isFiltered: Bool

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "cart")
                .font(.system(size: 60))
                .foregroundStyle(.quaternary)

            Text(isFiltered ? "No items in this category" : "Your grocery list is empty")
                .font(.headline)
                .foregroundStyle(.secondary)

            Text(isFiltered ? "Try selecting a different category\nor clear the filter." : "Tap \"Add New Item\" above\nto start your shopping list.")
                .font(.subheadline)
                .foregroundStyle(.tertiary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 60)
    }
}

#Preview {
    EmptyStateView(isFiltered: false)
}
