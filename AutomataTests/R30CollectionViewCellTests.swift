//
//  R30CollectionViewCellTests.swift
//  AutomataTests
//
//  Created by Ai on 6/13/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import XCTest
@testable import Automata

class R30CollectionViewCellTests: XCTestCase {

	var testCell: R30CollectionViewCell!
	
    override func setUp() {
		super.setUp()
		
		testCell = R30CollectionViewCell()
    }

    override func tearDown() {
		super.tearDown()
		
		testCell = nil
    }

	func testCellGetter_isActive() {
		//When
		testCell.backgroundColor = .black
		
		//Then
		XCTAssert(testCell.isActivated)
	}
	
	func testCellGetter_isDisabled() {
		//When
		testCell.backgroundColor = .white
		
		//Then
		XCTAssertFalse(testCell.isActivated)
	}
	
	func testCellSetter_isActive() {
		//When
		testCell.isActivated = true
		
		//Then
		XCTAssert(testCell.backgroundColor == .black)
	}
	
	func testCellSetter_isDisabled() {
		//When
		testCell.isActivated = false
		
		//Then
		XCTAssert(testCell.backgroundColor == .white)
	}
}
