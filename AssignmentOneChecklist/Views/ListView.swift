//
//  ListView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI
import ConfettiSwiftUI

struct ListView: View {
    @Environment(\.editMode) private var editMode
    
    @State var checklist: Checklist
    @Binding var model: DataModel
    
    @State var newTask: String = ""
    @State private var canUndo = false
    @State private var counter: Int = 0

    var body: some View {
        VStack {
            ListTitleView(checklist: $checklist, editMode: editMode!)
            Divider()
            NewTaskView(newTask: $newTask, onAddTask: addNewTask)
            Divider()
            List {
                ForEach(checklist.tasks) { task in
                    TaskRowView(task: task)
                    .onTapGesture {
                        toggleTask(task: task)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            let indexSet = IndexSet(integer: checklist.tasks.firstIndex(where: { $0.id == task.id })!)
                            deleteTask(at: indexSet)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.accentColor)
                    }
                }
                .onMove { indexSet, offset in
                    checklist.tasks.move(fromOffsets: indexSet, toOffset: offset)
                    checklist.save(to: &model)
                }
                .onDelete { indexSet in
                    deleteTask(at: indexSet)
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .confettiCannon(
                counter: $counter,
                num: 100,
                colors: [.accentColor, .purple],
                openingAngle: Angle(degrees: 0),
                closingAngle: Angle(degrees: 360),
                radius: 300
            )
        }
        .toolbar {
            let checked = checklist.tasks.contains(where: { $0.checked == true })  // checklist can only be reset if at least on task is checked
            if editMode?.wrappedValue.isEditing == true && checked {
                Button(action: onReset) { Text("Reset").foregroundColor(.red) }
            }
            if editMode?.wrappedValue.isEditing == true && canUndo == true {
                Button(action: undo) { Text("Undo").foregroundColor(.red) }
            }
            EditButton()
        }
        .onChange(of: editMode!.wrappedValue, perform: { value in
            value.isEditing ? () : checklist.save(to: &model)
        })
    }
    
    private func addNewTask() {
        checklist.tasks.append(Task(text: newTask))
        newTask = ""
        checklist.save(to: &model)
    }
    
    private func deleteTask(at offsets: IndexSet) {
        checklist.tasks.remove(atOffsets: offsets)
        checklist.save(to: &model)
    }
    
    private func toggleTask(task: Task) {
        if !task.checked { counter += 1 }
        if let index = checklist.tasks.firstIndex(where: { $0.id == task.id }) {
            checklist.tasks[index].checked.toggle()
            checklist.save(to: &model)
        }
    }
    
    private func onReset() {
        canUndo = true
        checklist.reset()
        checklist.save(to: &model)
    }

    private func undo() {
        canUndo = false
        checklist.undo()
        checklist.save(to: &model)
    }
}
