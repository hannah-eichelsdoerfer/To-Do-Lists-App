//
//  Task.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//

import Foundation

struct Task: Codable, Identifiable {
    var id: UUID = UUID()
    let text: String
    var checked: Bool = false
    var previousChecked: Bool = false
}

struct Checklist: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var tasks: [Task]
    var icon: Icon = Icon.checklist
    
    func save(to dataModelList: inout DataModel) {
        if let index = dataModelList.lists.firstIndex(where: { $0.id == self.id }) {
            dataModelList.lists[index] = self
            dataModelList.save()
        }
    }
    
    mutating func reset() {
        for i in 0..<tasks.count {
            tasks[i].previousChecked = tasks[i].checked
            tasks[i].checked = false
        }
    }

    mutating func undo() {
        for i in 0..<tasks.count {
            tasks[i].checked = tasks[i].previousChecked
        }
    }
}

struct DataModel: Codable {
    var lists : [Checklist]
    
    init () {
        lists = []
        load()
    }
    
    mutating func load() {
        guard let url = getFile(),
              let data = try? Data(contentsOf: url),
              let datamodel = try? JSONDecoder().decode(DataModel.self, from: data) else {
            self.lists = testLists
            return
        }
        self.lists = datamodel.lists
    }
    
    func save() {
        guard let url = getFile(),
              let data = try? JSONEncoder().encode(self) else { return }
        try? data.write(to: url)
    }
    
    // delete checklist
    mutating func delete(at offsets: IndexSet) {
        lists.remove(atOffsets: offsets)
        save()
    }

    // add new checklist
    mutating func addNewChecklist() {
        lists.append(Checklist(name: "New Checklist", tasks: []))
        save()
    }

    // change checklist order (onMove)
    mutating func move(from source: IndexSet, to destination: Int) {
        lists.move(fromOffsets: source, toOffset: destination)
        save()
    }
}

var testLists = [
    Checklist(name: "Home", tasks: [
        Task(text: "Do Laundry"),
        Task(text: "Clean Bathroom", checked: true),
        Task(text: "Vacuum", checked: true),
    ]),
    Checklist(name: "Uni", tasks: [
        Task(text: "Mobile Device Software Development 1"),
    ]),
    Checklist(name: "Work", tasks: [
        Task(text: "Finish Ticket Implementation"),
        Task(text: "Sign off on new project"),
        Task(text: "Release new version of app"),
    ]),
]

func getFile() -> URL? {
    let filename = "lists.json"
    let fm = FileManager.default
    guard let url = fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else {
        return nil
    }
    return url.appendingPathComponent(filename)
}

