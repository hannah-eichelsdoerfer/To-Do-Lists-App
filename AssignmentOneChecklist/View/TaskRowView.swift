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
            RoundedRectangle(cornerRadius: 20).foregroundColor(.gray).frame(width: 2, height: 45)
            Text(task.text).padding(.leading)
            Spacer()
            Image(systemName: task.checked ? "checkmark.circle" : "circle").resizable().foregroundColor(task.checked ? .black : .gray).frame(width: 24, height: 24)
        }
        .padding(4)
        .listRowSeparator(.hidden)
    }
}
