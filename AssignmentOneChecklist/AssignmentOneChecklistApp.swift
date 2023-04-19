//
//  AssignmentOneChecklistApp.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

/// The AssignmentOneChecklistApp struct represents the main app and contains the main view as well as the DataModel that is used by the app.
@main
struct AssignmentOneChecklistApp: App {
    @State var model: DataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ListsView(model: $model)
        }
    }
}
