//
//  ContentView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

struct ContentView: View {
    var tasks = ["Do Laundry", "Clean Bathroom", "Vacuum", "Mobile Device Software Development 1"]
    
    var body: some View {
        VStack {
            List {
                ForEach(tasks, id: \.self) {
                    task in
                    Text(task)
                }
            }.navigationTitle("To-do-List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
