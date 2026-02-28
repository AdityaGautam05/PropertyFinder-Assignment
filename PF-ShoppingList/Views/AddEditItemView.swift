//
//  AddEditItemView.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import SwiftUI

struct AddEditItemView: View {
    // Pass an existing item to edit, or nil to add
    let existingItem: ShoppingItem?
    let onSave: (String, Category) -> Void

    @Environment(\.dismiss) private var dismiss

    @State private var itemName: String = ""
    @State private var selectedCategory: Category = .milk
    @FocusState private var isNameFocused: Bool

    private var isEditing: Bool { existingItem != nil }
    private var isFormValid: Bool { !itemName.trimmingCharacters(in: .whitespaces).isEmpty }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                // Item Name
                VStack(alignment: .leading, spacing: 8) {
                    Text("Item Name")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)

                    TextField("e.g. Organic Apples", text: $itemName)
                        .padding(12)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .focused($isNameFocused)
                        .submitLabel(.done)
                        .onSubmit { if isFormValid { saveAndDismiss() } }
                }
                .padding(.horizontal)

                // Category Picker
                VStack(alignment: .leading, spacing: 12) {
                    Text("Category")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(Category.allCases) { category in
                                CategoryChipView(
                                    category: category,
                                    isSelected: selectedCategory == category
                                ) {
                                    selectedCategory = category
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                // Save Button
                Button(action: saveAndDismiss) {
                    HStack {
                        Image(systemName: isEditing ? "checkmark" : "plus")
                        Text(isEditing ? "Save Changes" : "Add Item")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(14)
                    .background(isFormValid ? Color.accentColor : Color.secondary.opacity(0.3))
                    .foregroundStyle(isFormValid ? .white : .secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .animation(.easeInOut(duration: 0.15), value: isFormValid)
                }
                .disabled(!isFormValid)
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 16)
            .navigationTitle(isEditing ? "Edit Item" : "New Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .onAppear {
                populateIfEditing()
                isNameFocused = true
            }
        }
    }

    // MARK: - Helpers

    private func populateIfEditing() {
        if let item = existingItem {
            itemName = item.name
            selectedCategory = item.category
        }
    }

    private func saveAndDismiss() {
        let trimmed = itemName.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        onSave(trimmed, selectedCategory)
        dismiss()
    }
}

// MARK: - Category chip inside the sheet



#Preview {
    AddEditItemView(existingItem: nil) { _, _ in }
}
