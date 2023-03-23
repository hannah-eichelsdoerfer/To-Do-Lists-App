//
//  TaskView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//

import SwiftUI

struct TaskView: View {
    let task: TaskModel
    
    var body: some View {
        HStack {
            Text(task.text)
            Spacer()
            Image(systemName: task.checked ? "checkmark.circle" : "circle").foregroundColor(task.checked ? .green : .gray)
        }
        .padding(4)
    }
}

struct TaskView1_Previews: PreviewProvider {
    static var task1 = TaskModel(text: "Item 1")
    
    static var previews: some View {
            TaskView(task: task1)
    }
}
