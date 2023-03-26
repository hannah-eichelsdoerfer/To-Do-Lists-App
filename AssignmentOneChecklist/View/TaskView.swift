//
//  TaskView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//

import SwiftUI

struct TaskView: View {
    let task: Task

    var body: some View {
        let color = findCategory(categoryId: task.categoryId)
        
        return HStack {
            RoundedRectangle(cornerRadius: 20).foregroundColor(color).frame(width: 2, height: 45)
            Text(task.text).padding(.leading)
            Spacer()
            Image(systemName: task.checked ? "checkmark.circle" : "circle").resizable().foregroundColor(task.checked ? .black : .gray).frame(width: 24, height: 24)
        }
        .padding(4)
        .listRowSeparator(.hidden)
    }
}
