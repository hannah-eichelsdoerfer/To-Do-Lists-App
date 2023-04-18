//
//  IconPickerView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 18/4/2023.
//

import SwiftUI

enum Icon: String, Codable, CaseIterable, Identifiable {
    case checklist, airplane, heart, graduationcap, cart, laptopcomputer, house, gamecontroller, clock, person
    var id: Self { self }
}


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
    }
}

struct IconPickerView_Previews: PreviewProvider {
    @State static var selectedIcon: Icon = .airplane
    
    static var previews: some View {
        IconPickerView(selectedIcon: $selectedIcon)
    }
}
