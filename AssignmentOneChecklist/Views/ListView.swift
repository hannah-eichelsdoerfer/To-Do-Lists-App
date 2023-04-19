//
//  ListView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI
import ConfettiSwiftUI

/// The ListView struct represents a view that displays the tasks of a checklist.
struct ListView: View {
    /// EditMode is a property wrapper that is used to determine whether the ListView is in edit mode.
    @Environment(\.editMode) private var editMode
    
    /// The checklist that the ListView is displaying.
    @State var checklist: Checklist
    /// The DataModel that the ListView is using.
    @Binding var model: DataModel
    
    /// The text of the new task that the user is adding to the checklist.
    @State var newTask: String = ""
    /// A boolean that indicates whether the user can undo the last action.
    @State private var canUndo = false
    /// A counter that is used to trigger the confetti animation.
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
    
    /// Adds a new task to the checklist and resets the newTask property to an empty string and saves the checklist to the DataModel.
    /// - Parameter newTask: The text of the new task that the user is adding to the checklist.
    private func addNewTask() {
        checklist.tasks.append(Task(text: newTask))
        newTask = ""
        checklist.save(to: &model)
    }
    
    /// Deletes a task from the checklist and saves the checklist to the DataModel.
    /// - Parameter offsets: The index of the task that the user is deleting from the checklist.
    private func deleteTask(at offsets: IndexSet) {
        checklist.tasks.remove(atOffsets: offsets)
        checklist.save(to: &model)
    }
    
    /// Toggles the checked property of a task and saves the checklist to the DataModel.
    /// - Parameter task: The task that the user is toggling.
    private func toggleTask(task: Task) {
        if !task.checked { counter += 1 }
        if let index = checklist.tasks.firstIndex(where: { $0.id == task.id }) {
            checklist.tasks[index].checked.toggle()
            checklist.save(to: &model)
        }
    }
    
    /// Resets the checklist and saves the checklist to the DataModel.
    private func onReset() {
        canUndo = true
        checklist.reset()
        checklist.save(to: &model)
    }

    /// Undoes the reset action and saves the checklist to the DataModel.
    private func undo() {
        canUndo = false
        checklist.undo()
        checklist.save(to: &model)
    }
}
