//
//  Category.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//

import SwiftUI

struct Category {
    let id: Int
    let name: String
    let color: Color
}

// Data
let categories: [Category] = [
    Category(id: 1, name: "University", color: .red),
    Category(id: 2, name: "Personal", color: .yellow),
    Category(id: 3, name: "Work", color: .blue)
]

/// Finds the category with the given id
/// - Parameter categoryId: The id of the category to find
/// - Returns: The color of the category with the given id, or gray if not found
func getCategoryColor(categoryId: Int) -> Color {
    if let category = categories.first(where: { $0.id == categoryId }) {
        return category.color
    } else {
        return .gray
    }
}
