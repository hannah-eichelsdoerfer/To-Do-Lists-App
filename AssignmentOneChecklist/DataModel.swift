//
//  Datamodel.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import Foundation

struct TaskModel: Identifiable {
    let id: UUID = UUID()
    let text: String
    let checked: Bool = false
}


