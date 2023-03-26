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

    func testTaskInitialization() throws {
        let task = Task(text: "Buy Groceries", categoryId: 1)
        XCTAssertEqual(task.text, "Buy Groceries")
        XCTAssertEqual(task.categoryId, 1)
        XCTAssertFalse(task.checked)
    }

    func testCategoryInitialization() throws {
        let category = Category(id: 1, name: "Shopping", color: .red)
        print(category.name)
        XCTAssertEqual(category.name, "Shopping")
        XCTAssertEqual(category.color, .red)
    }
    
    func testGetCategoryColor() {
       // Create task with valid category ID to check that the correct color is returned
       let taskWithValidCategory = Task(text: "Task 1", categoryId: 2)
       XCTAssertEqual(getCategoryColor(categoryId: taskWithValidCategory.categoryId), .yellow)
       
       // Create task with invalid category ID to check if default gray color is returned
       let taskWithInvalidCategory = Task(text: "Task 2", categoryId: 4)
       XCTAssertEqual(getCategoryColor(categoryId: taskWithInvalidCategory.categoryId), .gray)
   }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
