//
//  ContentView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
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
