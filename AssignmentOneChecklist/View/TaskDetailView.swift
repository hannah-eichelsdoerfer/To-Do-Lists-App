//
//  TaskDetailView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 26/3/2023.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task

    var body: some View {
        VStack {
            Text("TO-DO").foregroundColor(.gray)
            Spacer()
        }.navigationTitle(task.text)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: tasks[1])
    }
}
