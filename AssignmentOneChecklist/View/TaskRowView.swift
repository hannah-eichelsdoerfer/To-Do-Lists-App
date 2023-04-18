//
//  TaskRowView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//
import SwiftUI

struct TaskRowView: View {
    var task: Task

    var body: some View {
        return HStack {
            Text(task.text)
            Spacer()
            Image(systemName: task.checked ? "checkmark.square.fill" : "square").resizable().foregroundColor(task.checked ? .black : .gray).frame(width: 24, height: 24)
        }
        .padding([.vertical], 10)
        .listRowSeparator(.hidden)
    }
}
