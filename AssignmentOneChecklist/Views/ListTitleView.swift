//
//  ListTitleView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 19/4/2023.
//

import SwiftUI

struct ListTitleView: View {
    @Binding var checklist: Checklist
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
