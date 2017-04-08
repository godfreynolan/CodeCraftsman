//
//  ETAMockUITests.swift
//  ETAMockUITests
//
//  Created by Donald Freeman on 3/22/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import XCTest

class ETAMockUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testExample() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Smart"].tap()
        tablesQuery.staticTexts["SOUTHSHORE"].tap()
        app.buttons["Southbound"].tap()
    }
}
