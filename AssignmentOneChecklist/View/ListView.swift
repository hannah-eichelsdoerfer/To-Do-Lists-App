//
//  ContentView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

struct ListView: View {
    var checklist: Checklist

    @State var tasks: [Task] = testTasks
    
    var body: some View {
        VStack {
            Text(checklist.name).font(.title)
            List {
                ForEach(tasks) { task in
                    TaskRowView(task: task)
                }
            }
            .listStyle(.plain)
            .navigationTitle("To-Do List")
        }
    }
}
