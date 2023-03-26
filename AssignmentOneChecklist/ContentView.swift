//
//  ContentView.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 21/3/2023.
//

import SwiftUI

struct ContentView: View {    
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
