//
//  ContentView.swift
//  PF-ShoppingList
//
//  Created by Aditya Gautam on 2/28/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ShoppingItem.dateAdded) private var items: [ShoppingItem]

    @State private var viewModel: ShoppingListViewModel?
    @State private var showingAddSheet = false
    @State private var itemToEdit: ShoppingItem? = nil

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Category filter strip
                if let vm = viewModel {
                    CategoryFilterView(selectedFilter: Binding(
                        get: { vm.selectedFilter },
                        set: { vm.selectedFilter = $0 }
                    ))
                    .background(Color(.systemBackground))
                    Divider()

                    let filtered = vm.filteredItems(items)

                    if filtered.isEmpty {
                        EmptyStateView(isFiltered: vm.selectedFilter != nil)
                    } else {
                        List {
                            ForEach(filtered) { item in
                                ItemRowView(item: item) {
                                    vm.toggleCompleted(item)
                                }
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Button(role: .destructive) {
                                        vm.deleteItem(item)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                                .swipeActions(edge: .leading) {
                                    Button {
                                        itemToEdit = item
                                    } label: {
                                        Label("Edit", systemImage: "pencil")
                                    }
                                    .tint(.orange)
                                }
                                .contentShape(Rectangle())
                                .onTapGesture { itemToEdit = item }
                            }
                        }
                        .listStyle(.plain)
                        .animation(.default, value: filtered.count)
                    }
                }
            }
            .navigationTitle("Grocery List")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAddSheet = true
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "plus")
                            Text("Add New Item")
                                .fontWeight(.semibold)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                    }
                    .buttonStyle(.borderless)
                    .clipShape(.capsule)
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                if let vm = viewModel {
                    AddEditItemView(existingItem: nil) { name, category in
                        vm.addItem(name: name, category: category)
                    }
                    .presentationDetents([.medium, .large])
                }
            }
            .sheet(item: $itemToEdit) { item in
                if let vm = viewModel {
                    AddEditItemView(existingItem: item) { name, category in
                        vm.updateItem(item, name: name, category: category)
                    }
                    .presentationDetents([.medium, .large])
                }
            }
        }
        .onAppear {
            if viewModel == nil {
                viewModel = ShoppingListViewModel(modelContext: modelContext)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ShoppingItem.self, inMemory: true)
}
