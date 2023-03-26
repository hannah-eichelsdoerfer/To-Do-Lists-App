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

    static let all = [
        Category(id: 1, name: "University", color: Color.red),
        Category(id: 2, name: "Personal", color: Color.yellow),
        Category(id: 3, name: "Work", color: Color.blue)
    ]
}

var categories: [Category] = [
    Category(id: 1, name: "University", color: Color.red),
    Category(id: 2, name: "Personal", color: Color.yellow),
    Category(id: 3, name: "Work", color: Color.blue)
]

///  Finds the category with the given id
///  - parameter categoryId: the id of the category to find
///  - Returns: the color of the category with the given id
func findCategory(categoryId: Int) -> Color {
    categories.first(where: { $0.id == categoryId })!.color
}
