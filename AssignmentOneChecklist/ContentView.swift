//
//  ContentView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

struct ContentView: View {
    var tasks: [Task] = [
        Task(text: "Do Laundry", categoryId: 2),
        Task(text: "Clean Bathroom", categoryId: 2, checked: true),
        Task(text: "Vacuum", categoryId: 2, checked: true),
        Task(text: "Mobile Device Software Development 1", categoryId: 1),
        Task(text: "Finish Ticket Implementation", categoryId: 3)
    ]
    
    var body: some View {
        VStack {
            Text("To-Do List ").font(.title).fontWeight(.bold).padding([.vertical], 16)
            List {
                ForEach(tasks) { task in
                    TaskView(task: task)
                }
            }
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
