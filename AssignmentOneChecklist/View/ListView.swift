//
//  ListView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

struct ListView: View {
    @State var checklist: Checklist
    @Binding var model: DataModel
    
    @State var newTask : String = ""
    
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        VStack {
            if editMode?.wrappedValue.isEditing == true {
                // editable TextField that saves changes to the checklist
                TextField("Enter new name", text: $checklist.name)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: checklist.name) { _ in
                        checklist.save(to: &model)
                    }
            }
            if editMode?.wrappedValue.isEditing == false {
                Text(checklist.name).font(.title).padding().frame(maxWidth: .infinity, alignment: .leading)
            }
            List {
                HStack {
                    TextField("Enter new task", text: self.$newTask)
                    Button(action: addNewTask, label: { Image(systemName: "plus").resizable()
                            .padding(6)
                            .frame(width: 24, height: 24)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white) })
                    .disabled(newTask.isEmpty)
                }
                ForEach(checklist.tasks) { task in
                    TaskRowView(task: task)
                    .onTapGesture {
                        toggleTask(task: task)
                    }
                }
                .onDelete { indexSet in
                    checklist.tasks.remove(atOffsets: indexSet)
                    checklist.save(to: &model)
                }
                .onMove { indexSet, offset in
                    checklist.tasks.move(fromOffsets: indexSet, toOffset: offset)
                    checklist.save(to: &model)
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
    
    func toggleTask(task: Task) {
        if let index = checklist.tasks.firstIndex(where: { $0.id == task.id }) {
            checklist.tasks[index].previousChecked = checklist.tasks[index].checked
            checklist.tasks[index].checked.toggle()
            checklist.save(to: &model)
        }
    }
    
    func addNewTask() {
        checklist.tasks.append(Task(text: newTask))
        newTask = ""
        checklist.save(to: &model)
    }
    
    func onReset() {
        checklist.reset()
        checklist.save(to: &model)
    }
}
