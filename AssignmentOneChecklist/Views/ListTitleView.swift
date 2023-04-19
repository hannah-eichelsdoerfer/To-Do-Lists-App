//
//  ListTitleView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 19/4/2023.
//

import SwiftUI

/// The ListTitleView struct represents a view that displays the title of a checklist and the icon of the checklist.
/// In edit mode, the user can edit the name of the checklist and select a new icon.
struct ListTitleView: View {
    /// The checklist that the ListTitleView is referencing.
    @Binding var checklist: Checklist
    /// The inherited EditMode which is used to determine whether the ListTitleView is in edit mode.
    var editMode: Binding<EditMode>
    
    var body: some View {
        VStack {
            if editMode.wrappedValue.isEditing == true {
                HStack {
                    TextField("Checklist Name", text: $checklist.name)
                        .font(.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    IconPickerView(selectedIcon: $checklist.icon)
                }
            }
            if editMode.wrappedValue.isEditing == false {
                HStack {
                    Text(checklist.name).font(.largeTitle).padding().frame(maxWidth: .infinity, alignment: .leading).fontWeight(.bold)
                    Image(systemName: checklist.icon.rawValue).padding() .font(.title2)
                }
            }
        }
    }
}
