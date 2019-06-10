//
//  AutomataTests.swift
//  AutomataTests
//
//  Created by Ai on 6/7/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import XCTest
@testable import Automata

class AutomataTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	//Ai: Will need to move these out to separate classes
	func testIsOriginCell_NotMiddleCell() {
		//Given
		let testCellManager = CellManager.init()
		let testIndexPath =  IndexPath(item: 2, section: 0)
		let testCellsPerRow = 10
		
		//When
		let isOrigin = testCellManager.isOriginCell(indexPath: testIndexPath, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertFalse(isOrigin)
	}
	
	func testIsOriginCell_MiddleCell_EvenNumber() {
		//Given
		let testCellManager = CellManager.init()
		let testIndexPath =  IndexPath(item: 5, section: 0)
		let testCellsPerRow = 10
		
		//When
		let isOrigin = testCellManager.isOriginCell(indexPath: testIndexPath, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertTrue(isOrigin)
	}
	
	func testIsOriginCell_MiddleCell_OddNumberRoundsDown() {
		//Given
		let testCellManager = CellManager.init()
		let testIndexPath =  IndexPath(item: 4, section: 0)
		let testCellsPerRow = 9
		
		//When
		let isOrigin = testCellManager.isOriginCell(indexPath: testIndexPath, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertTrue(isOrigin)
	}
	
	func testIsOriginCell_MiddleCell_OddNumberDoesNotRoundUp() {
		//Given
		let testCellManager = CellManager.init()
		let testIndexPath =  IndexPath(item: 5, section: 0)
		let testCellsPerRow = 9
		
		//When
		let isOrigin = testCellManager.isOriginCell(indexPath: testIndexPath, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertFalse(isOrigin)
	}
	
	func testCellFor_ActiveCell() {
		//Given
		
		//When
		
		//Then
	}
	
	func testCellFor_DisabledCell() {
		//Given
		
		//When
		
		//Then
	}
}
