# PF Shopping List

A clean and minimal iOS grocery list app built with SwiftUI and SwiftData. Manage your shopping list with category organization, quick filtering, and persistent storage — all in a native, lightweight package.

---

## Features

- **Add & Edit Items** — Create items via a bottom sheet with a name field and a horizontal category chip picker. Tap any row or swipe left to edit.
- **Delete Items** — Swipe right (full swipe supported) to instantly delete an item.
- **Complete Items** — Tap the circle next to any item to mark it done; the item gets a strikethrough with a smooth animation.
- **Category Organization** — Every item belongs to one of six categories, each with a distinct color and emoji badge displayed inline on the row.
- **Category Filtering** — A sticky horizontal chip strip at the top lets you filter the list to a single category instantly.
- **Empty State** — Contextual empty-state messages guide the user when the list is empty or a filter has no results.
- **Persistent Storage** — All data is saved automatically via SwiftData and survives app restarts.
- **Sorted by Date** — Items appear in the order they were added.

---

## Categories

| Category    | Emoji |
|-------------|-------|
| Milk        | 🥛    |
| Vegetables  | 🥦    |
| Fruits      | 🍎    |
| Breads      | 🍞    |
| Meats       | 🥩    |
| None        | 🤔    |

---

## Project Structure

```
PF-ShoppingList/
├── Models/
│   ├── ShoppingItem.swift       # SwiftData model (name, category, isCompleted, dateAdded)
│   └── Category.swift           # Enum with display name, emoji, and color per category
├── View Models/
│   └── ShoppingListViewModel.swift  # CRUD operations + category filter state
└── Views/
    ├── ContentView.swift        # Root view — list, toolbar, sheet presentation
    ├── AddEditItemView.swift    # Add / edit sheet with name input and category picker
    ├── ItemRowView.swift        # Single list row with completion toggle and category badge
    ├── CategoryFilterView.swift # Horizontal scrollable filter chip strip
    ├── CategoryChipView.swift   # Individual category chip used in the add/edit sheet
    ├── FilterChipView.swift     # Individual chip used in the filter strip
    └── EmptyStateView.swift     # Empty state for no items or no filtered results
```

---

## Tech Stack

| Layer       | Technology                          |
|-------------|-------------------------------------|
| UI          | SwiftUI                             |
| Persistence | SwiftData                           |
| Architecture| MVVM (`@Observable` view model)     |
| State       | `@Query`, `@Environment`, `@State`  |

---

## Requirements

- iOS 17+
- Xcode 26
- Swift 6
