//
//  NewTaskView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 19/4/2023.
//

import SwiftUI

struct NewTaskView: View {
    @Binding var newTask: String
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
