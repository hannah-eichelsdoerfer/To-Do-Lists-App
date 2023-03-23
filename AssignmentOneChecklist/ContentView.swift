//
//  ContentView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

struct ContentView: View {
    var tasks: [TaskModel] = [
        TaskModel(text: "Do Laundry"),
        TaskModel(text: "Clean Bathroom", checked: true),
        TaskModel(text: "Vacuum", checked: true),
        TaskModel(text: "Mobile Device Software Development 1")
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(tasks) { task in
                    TaskView(task: task)
                }
            }
        }
        .fontDesign(.monospaced)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
