//
//  TaskRowView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//
import SwiftUI


/// The TaskRowView struct represents a view that displays a task in a checklist with its text and a checkbox.
struct TaskRowView: View {
    /// The task that the TaskRowView is referencing.
    var task: Task

    var body: some View {
        return HStack {
            Text(task.text).padding([.trailing], 30)
            Spacer()
            Image(systemName: task.checked ? "checkmark.square.fill" : "square")
                .resizable()
                .foregroundColor(task.checked ? .accentColor : .gray)
                .frame(width: 24, height: 24)
        }
        .padding([.vertical], 10)
        .listRowSeparator(.hidden)
    }
}
