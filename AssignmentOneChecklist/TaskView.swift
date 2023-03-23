//
//  TaskView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//

import SwiftUI

struct TaskView: View {
    var task: String
    
    var body: some View {
        HStack {
            Text(task)
            Spacer()
            Image(systemName: "checkmark.circle").foregroundColor(.gray)
        }
    }
}
