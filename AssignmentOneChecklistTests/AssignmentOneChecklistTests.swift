//
//  AssignmentOneChecklistTests.swift
//  AssignmentOneChecklistTests
//
//  Created by Hannah on 21/3/2023.
//

import XCTest
@testable import AssignmentOneChecklist

final class AssignmentOneChecklistTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// This function tests the ``DataModel/load()`` function.
    func testLoadData() {
        let expectedLists = [
            Checklist(name: "Shopping", tasks: [
                Task(text: "Milk"),
                Task(text: "Bread"),
                Task(text: "Eggs"),
            ]),
            Checklist(name: "Gym", tasks: [
                Task(text: "Pushups", checked: true),
                Task(text: "Squats"),
                Task(text: "Bench Press"),
            ]),
        ]
        var dataModel = DataModel()
        dataModel.lists = expectedLists
        dataModel.save()
        
        var loadedDataModel = DataModel()
        loadedDataModel.load()
        XCTAssertEqual(loadedDataModel.lists.count, expectedLists.count)
        XCTAssertEqual(loadedDataModel.lists.first?.name, expectedLists.first?.name)
        XCTAssertEqual(loadedDataModel.lists.first?.tasks.count, expectedLists.first?.tasks.count)
    }
    
    /// This function tests the ``DataModel/save()`` function.
    func testSaveData() {
        var dataModel = DataModel()
        dataModel.lists = testLists
        dataModel.save()
        
        let loadedDataModel = DataModel()
        XCTAssertEqual(loadedDataModel.lists.count, testLists.count)
        XCTAssertEqual(loadedDataModel.lists.first?.name, testLists.first?.name)
        XCTAssertEqual(loadedDataModel.lists.first?.tasks.count, testLists.first?.tasks.count)
    }

    /// This function tests the ``Checklist/addNewChecklist()`` function.
    func testAddNewChecklist() {
        var dataModel = DataModel()
        dataModel.lists = testLists
        dataModel.addNewChecklist()
        
        XCTAssertEqual(dataModel.lists.count, 4)
        XCTAssertEqual(dataModel.lists.last?.name, "New Checklist")
        XCTAssertEqual(dataModel.lists.last?.icon, .checklist)
    }

    /// This function tests the ``Checklist/delete(at: offset)`` function.
    func testDeleteChecklist() {
        var dataModel = DataModel()
        dataModel.lists = testLists
        dataModel.delete(at: IndexSet(integer: 0))
        
        XCTAssertEqual(dataModel.lists.count, 2)
        XCTAssertEqual(dataModel.lists.first?.name, "Uni")
    }
    
    /// This function tests the ``Checklist/reset()`` and ``Checklist/undo()`` functions.
    func testResetAndUndo() {
        var dataModel = DataModel()
        dataModel.lists = testLists

        dataModel.lists[0].reset()
    
        XCTAssertEqual(dataModel.lists[0].tasks[0].checked, false)
        XCTAssertEqual(dataModel.lists[0].tasks[1].checked, false)
        XCTAssertEqual(dataModel.lists[0].tasks[2].checked, false)
        
        dataModel.lists[0].undo()
        
         XCTAssertEqual(dataModel.lists[0].tasks[0].checked, false)
         XCTAssertEqual(dataModel.lists[0].tasks[1].checked, true)
         XCTAssertEqual(dataModel.lists[0].tasks[2].checked, true)
    }

    /// This function tests if the ``Checklist/Icon`` enum is working correctly.
    func testIconMatching() {
        let expectedLists = [
            Checklist(name: "Shopping", tasks: [
                Task(text: "Milk"),
                Task(text: "Bread"),
                Task(text: "Eggs"),
            ], icon: .cart),
            Checklist(name: "Gym", tasks: [
                Task(text: "Pushups", checked: true),
                Task(text: "Squats"),
                Task(text: "Bench Press"),
            ], icon: .gamecontroller),
        ]
        
        XCTAssertEqual(expectedLists.first?.icon, .cart)
        XCTAssertEqual(expectedLists.last?.icon, .gamecontroller)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
