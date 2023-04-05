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
    var checked: Bool = false
}

// Data
var tasks: [Task] = [
    Task(text: "Do Laundry"),
    Task(text: "Clean Bathroom", checked: true),
    Task(text: "Vacuum", checked: true),
    Task(text: "Mobile Device Software Development 1"),
    Task(text: "Finish Ticket Implementation")
]
