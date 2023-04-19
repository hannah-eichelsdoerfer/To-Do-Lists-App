//
//  IconPickerView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 18/4/2023.
//

import SwiftUI

/// The Icon enum represents the icon of a checklist.
enum Icon: String, Codable, CaseIterable, Identifiable {
    case checklist, airplane, heart, graduationcap, cart, laptopcomputer, house, gamecontroller, clock, person
    var id: Self { self }
}

/// The IconPickerView struct represents a view that allows the user to select an icon from a menu.
struct IconPickerView: View {
    @Binding var selectedIcon: Icon
    
    var body: some View {
        Picker("Icon", selection: $selectedIcon) {
            ForEach(Icon.allCases) { icon in
                Image(systemName: icon.rawValue)
            }
            .labelsHidden()
        }
        .pickerStyle(.menu)
        .labelsHidden()
        .tint(.primary)
    }
}

struct IconPickerView_Previews: PreviewProvider {
    @State static var selectedIcon: Icon = .airplane
    
    static var previews: some View {
        IconPickerView(selectedIcon: $selectedIcon)
    }
}
