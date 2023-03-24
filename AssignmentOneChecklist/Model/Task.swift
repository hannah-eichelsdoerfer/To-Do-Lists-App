//
//  Task.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//

import Foundation

struct Task: Identifiable {
    let id: UUID = UUID()
    let text: String
    let categoryId: Int
    var checked: Bool = false
}
