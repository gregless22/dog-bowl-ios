//
//  dog_bowlUITests.swift
//  dog-bowlUITests
//
//  Created by iMac on 16/6/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import XCTest

class dog_bowlUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearch() {
		//get app reference
		let app = XCUIApplication()
		
		//start the test

		app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .searchField).element.tap()
		//app.searchFields.containing(.button, identifier:"Clear text").element.tap()
		//app.searchFields.buttons["Clear text"].tap()
		
	
    }
	
	func testTableView(){
		//test label is there.
		
		let app = XCUIApplication()
		app.tabBars.buttons["List View"].tap()
		app.tables.cells.otherElements.containing(.image, identifier:"iga").element.tap()

	}
	
	func testExistance(){
		//app reference
		let app = XCUIApplication()
		
		app.tabBars.buttons["List View"].tap()
		app.tables/*@START_MENU_TOKEN@*/.staticTexts["IGA Maroochydore"]/*[[".cells.staticTexts[\"IGA Maroochydore\"]",".staticTexts[\"IGA Maroochydore\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
		
		let scrollViewsQuery = app.scrollViews
		let elementsQuery = scrollViewsQuery.otherElements
		
		// check elements exits
		XCTAssertTrue(elementsQuery.staticTexts["IGA Maroochydore"].exists)
		

		elementsQuery.staticTexts["Other"].tap()
		
		let rateButton = elementsQuery.buttons["Rate"]

		elementsQuery.buttons["Report"].tap()
		elementsQuery.buttons["Update"].tap()
		scrollViewsQuery.otherElements.containing(.image, identifier:"iga").element.swipeUp()
		
	}
	
	func testTesting(){
		let app = XCUIApplication()
		
		let tested = app.staticTexts["detailTitle"]
		XCTAssertEqual(tested.label, "Label")
	}
    
}
