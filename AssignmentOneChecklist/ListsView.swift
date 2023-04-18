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
                ForEach(Array(model.lists.enumerated()), id: \.element.id) { index, checklist in
                    NavigationLink(destination: ListView(checklist: checklist, model: $model)) {
                        HStack {
                            Image(systemName: checklist.icon.rawValue).imageScale(.medium)
                            Text(checklist.name).padding()
                        }
                    }
                    .listRowSeparator(.hidden)
                    .swipeActions {
                        Button(role: .destructive) {
                            model.delete(at: IndexSet(integer: index))
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.accentColor)
                    }
                }
                .onMove { indexSet, offset in
                    model.move(from: indexSet, to: offset)
                }
                .onDelete { indexSet in
                    model.delete(at: indexSet)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Checklists")
            .navigationBarItems(
                trailing: EditButton()
            )
            .safeAreaInset(edge: VerticalEdge.bottom) {
                Button(action: { model.addNewChecklist()}) {
                    Label("New List", systemImage: "plus")
                        .padding([.horizontal], 90)
                        .padding([.vertical], 5)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        var model = DataModel()
        model.load()

        return ListsView(model: .constant(model))
    }
}
