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
    
    func testInitialization() {
        let expectedLists = testLists
        var dataModel = DataModel()
        dataModel.lists = expectedLists
        dataModel.save()
        
        let newDataModel = DataModel()
        XCTAssertEqual(newDataModel.lists.count, expectedLists.count)
        XCTAssertEqual(newDataModel.lists.first?.name, expectedLists.first?.name)
        XCTAssertEqual(newDataModel.lists.first?.tasks.count, expectedLists.first?.tasks.count)
    }
    
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
    
    func testSaveData() {
        let expectedLists = testLists
        var dataModel = DataModel()
        dataModel.lists = expectedLists
        dataModel.save()
        
        let loadedDataModel = DataModel()
        XCTAssertEqual(loadedDataModel.lists.count, expectedLists.count)
        XCTAssertEqual(loadedDataModel.lists.first?.name, expectedLists.first?.name)
        XCTAssertEqual(loadedDataModel.lists.first?.tasks.count, expectedLists.first?.tasks.count)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
