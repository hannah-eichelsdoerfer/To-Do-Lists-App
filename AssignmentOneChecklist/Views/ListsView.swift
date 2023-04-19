//
//  Lists.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 5/4/2023.
//

import SwiftUI

/// The ListsView struct represents a view that displays all checklists in a list.
struct ListsView: View {
    /// The DataModel that the ListsView is referencing.
    @Binding var model: DataModel
    /// The state is indicating whether the app is loading or not.
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView().scaleEffect(2.0)
                    .navigationTitle("Checklists")
            } else {
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
                    /// This allows the user to reorder the checklists by dragging them.
                    .onMove { indexSet, offset in
                        model.move(from: indexSet, to: offset)
                    }
                    /// This allows the user to delete a checklist by swiping it to the left.
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
        .onAppear {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//              model.load()
                isLoading = false
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
