//
//  CategoryFilterView.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import SwiftUI

struct CategoryFilterView: View {
    @Binding var selectedFilter: Category?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                FilterChipView(
                    title: "All",
                    emoji: "🛒",
                    color: .gray,
                    isSelected: selectedFilter == nil
                ) {
                    selectedFilter = nil
                }

                ForEach(Category.allCases) { category in
                    FilterChipView(
                        title: category.displayName,
                        emoji: category.emoji,
                        color: category.color,
                        isSelected: selectedFilter == category
                    ) {
                        selectedFilter = category
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}
