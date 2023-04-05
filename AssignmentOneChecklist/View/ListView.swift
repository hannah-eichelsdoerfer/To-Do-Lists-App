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
    @State var newTask : String = ""
    
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        VStack {
            Text(checklist.name).font(.title)
            List {
                HStack {
                    TextField("Enter new task", text: self.$newTask)
                    Button(action: addNewTask, label: { Image(systemName: "plus").resizable()
                            .padding(6)
                            .frame(width: 24, height: 24)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white) })
                }
                ForEach(tasks) { task in
                    TaskRowView(task: task)
                }
                .onDelete { indexSet in
                    tasks.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
        }
        .toolbar {
            if editMode?.wrappedValue.isEditing == true {
                Button(action: onReset) { Text("Reset").foregroundColor(.red) }
            }
            EditButton()
            
        }
    }
    
    func addNewTask() {
        tasks.append(Task(text: newTask))
    }
    
    func onReset() {
            
    }
}