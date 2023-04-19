//
//  NewTaskView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 19/4/2023.
//

import SwiftUI

/// The NewTaskView struct represents a view that allows the user to add a new task to a checklist.
struct NewTaskView: View {
    /// The new task text that the user is entering.
    @Binding var newTask: String
    /// The action that is performed when the user adds a new task.
    var onAddTask: () -> Void

    var body: some View {
        HStack {
            TextField("New task", text: $newTask).onSubmit(onAddTask)
            Button(action: onAddTask, label: {
                Image(systemName: "plus")
                    .resizable()
                    .padding(6)
                    .frame(width: 28, height: 28)
            })
            .disabled(newTask.isEmpty)
        }
        .padding([.horizontal], 20)
        .padding([.vertical], 10)
    }
}
