//
//  ChecklistView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 5/4/2023.
//

import SwiftUI

struct Checklist: Identifiable {
    let id: UUID
    var name: String
}

struct ListsView: View {
//    @Binding
    @State var checklists: [Checklist]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklists) { checklist in
                    NavigationLink(destination: Text(checklist.name)) {
                        Text(checklist.name)
                    }
                }
                .onDelete { indexSet in
                    tasks.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Checklists")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: add, label: { Image(systemName: "plus")})
            )
        }
    }
    
    func add(){
        checklists.append(Checklist(id: UUID(), name: "New List"))
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView(checklists: [Checklist(id: UUID(), name: "Groceries")])
    }
}
