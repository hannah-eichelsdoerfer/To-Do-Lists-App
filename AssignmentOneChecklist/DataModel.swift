//
//  Datamodel.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import Foundation
import SwiftUI

struct TaskModel: Identifiable {
    let id: UUID = UUID()
    let text: String
    let categoryId: Int
    var checked: Bool = false
}

struct Category {
    let id: Int
    let name: String
    let color: Color
}


