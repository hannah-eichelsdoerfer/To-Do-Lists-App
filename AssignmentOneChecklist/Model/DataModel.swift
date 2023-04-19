//
//  Task.swift
//  AssignmentOneChecklist
//
//  Created by Hannah on 24/3/2023.
//

import Foundation

/// The Task struct represents a task in a checklist.
/// Each task has a unique identifier, a text with its name or description, and a boolean indicating whether it has been checked or not.
struct Task: Codable, Identifiable {
    /// The unique identifier of the task.
    var id: UUID = UUID()
    /// The text of the task.
    let text: String
    /// A boolean indicating whether the task has been checked or not.
    var checked: Bool = false
    /// A boolean indicating whether the task was checked in the previous state.
    var previousChecked: Bool = false
}

/// The Checklist struct represents a checklist.
/// Each checklist has a unique identifier, a name, an array of tasks, and an icon.
struct Checklist: Codable, Identifiable {
    /// The unique identifier of the checklist.
    var id: UUID = UUID()
    /// The name of the checklist.
    var name: String
    /// The array of ``Task``s in the checklist.
    var tasks: [Task]
    /// The ``Icon`` of the checklist (default is the SF symbol checklist)
    var icon: Icon = Icon.checklist
    
    /// This function saves the checklist to the provided ``DataModel``.
    func save(to dataModelList: inout DataModel) {
        if let index = dataModelList.lists.firstIndex(where: { $0.id == self.id }) {
            dataModelList.lists[index] = self
            dataModelList.save()
        }
    }
    
    /// This function resets all tasks in the checklist to unchecked by setting the `checked` property to false and saving the previous state in the `previousChecked` property.
    mutating func reset() {
        for i in 0..<tasks.count {
            tasks[i].previousChecked = tasks[i].checked
            tasks[i].checked = false
        }
    }

    /// This function reverts all tasks in the checklist to their previous state stored in the `previousChecked` propery.
    mutating func undo() {
        for i in 0..<tasks.count {
            tasks[i].checked = tasks[i].previousChecked
        }
    }
}

/// The DataModel struct stores all checklists and provides functions to save and load them.
struct DataModel: Codable {
    /// Array of checklists in the DataModel.
    var lists : [Checklist]
    
    /// Initializes the DataModel with an empty array of checklists.
    init () {
        lists = []
        /// Loads the checklists from the file.
        load()
    }
    
    /** Loads the checklists from the file.
     If the file does not exist, it loads the test checklists.
     If the file exists, it loads the checklists from the file.
     */
    mutating func load() {
        guard let url = getFile(),
              let data = try? Data(contentsOf: url),
              let datamodel = try? JSONDecoder().decode(DataModel.self, from: data) else {
            self.lists = testLists
            return
        }
        self.lists = datamodel.lists
    }
    
    /// Saves the checklists to the file.
    func save() {
        guard let url = getFile(),
              let data = try? JSONEncoder().encode(self) else { return }
        try? data.write(to: url)
    }

    /// Adds a new checklist and saves the DataModel.
    mutating func addNewChecklist() {
        lists.append(Checklist(name: "New Checklist", tasks: []))
        save()
    }
    
    /// Deletes a checklist and saves the DataModel.
    /// - Parameter offsets: The index of the checklist to be deleted.
    mutating func delete(at offsets: IndexSet) {
        lists.remove(atOffsets: offsets)
        save()
    }

    /// Changes the order of the checklists and saves the DataModel.
    /// - Parameters:
    ///   - source: The index of the checklist to be moved.
    ///   - destination: The index of the checklist to be moved to.
    mutating func move(from source: IndexSet, to destination: Int) {
        lists.move(fromOffsets: source, toOffset: destination)
        save()
    }
}

/// This function is used to get the URL of the file where the data is saved.
/// - Returns: URL of the file where the data is saved.
func getFile() -> URL? {
    let filename = "lists.json"
    let fm = FileManager.default
    guard let url = fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else {
        return nil
    }
    return url.appendingPathComponent(filename)
}

var testLists = [
    Checklist(name: "Home", tasks: [
        Task(text: "Do Laundry"),
        Task(text: "Clean Bathroom", checked: true),
        Task(text: "Vacuum", checked: true),
    ], icon: .house),
    Checklist(name: "Uni", tasks: [
        Task(text: "Mobile Device Software Development 1"),
    ]),
    Checklist(name: "Work", tasks: [
        Task(text: "Finish Ticket Implementation"),
        Task(text: "Sign off on new project"),
        Task(text: "Release new version of app"),
    ]),
]

