//
//  AssignmentOneChecklistApp.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

@main
struct AssignmentOneChecklistApp: App {
    @State var model: DataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ListsView(model: $model)
        }
    }
}
