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

// Data
var tasks: [Task] = [
    Task(text: "Do Laundry", categoryId: 2),
    Task(text: "Clean Bathroom", categoryId: 2, checked: true),
    Task(text: "Vacuum", categoryId: 2, checked: true),
    Task(text: "Mobile Device Software Development 1", categoryId: 1),
    Task(text: "Finish Ticket Implementation", categoryId: 3)
]
