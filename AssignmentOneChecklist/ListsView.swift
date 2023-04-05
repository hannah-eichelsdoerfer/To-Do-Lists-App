//
//  Lists.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 5/4/2023.
//

import SwiftUI

struct ListsView: View {
    @Binding var model: DataModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.lists) { checklist in
                    NavigationLink(destination: ListView(checklist: checklist, model: $model)) {
                        Text(checklist.name)
                    }
                }
                .onMove { indexSet, offset in
                    model.lists.move(fromOffsets: indexSet, toOffset: offset)
                    model.save()
                }
                .onDelete { indexSet in
                    model.lists.remove(atOffsets: indexSet)
                    model.save()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Checklists")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: add, label: { Image(systemName: "plus")})
            )
        }
    }
    
    func add(){
        model.lists.append(Checklist(id: UUID(), name: "New List", tasks: []))
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        var model = DataModel()
        model.load()

        // Create a checklist and add it to the model for previewing purposes
        let checklist = Checklist(id: UUID(), name: "List 3", tasks: [
            Task(text: "Task 1"),
            Task( text: "Task 2"),
            Task(text: "Task 3"),
        ])
        model.lists.append(checklist)

        return ListsView(model: .constant(model))
    }
}
