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
	
// MARK: - CellManager Tests -
	func testCellFor_Activates_OriginCell() {
		//Given
		let testLayout = UICollectionViewLayout()
		let testCollectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0)), collectionViewLayout: testLayout)
		R30CollectionViewCell.register(with: testCollectionView)
		let testCellManager = CellManager.init()
		let testIndexPath =  IndexPath(item: 5, section: 0)
		let testCellsPerRow = 10
		
		//When
		let cell = testCellManager.cellFor(indexPath: testIndexPath, collectionView: testCollectionView, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssert(cell.backgroundColor == .black)
	}

	func testCellFor_DoesNotActivate_FirstRowNonMiddleCell() {
		//Given
		let testLayout = UICollectionViewLayout()
		let testCollectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0)), collectionViewLayout: testLayout)
		R30CollectionViewCell.register(with: testCollectionView)
		let testCellManager = CellManager.init()
		let testIndexPath =  IndexPath(item: 3, section: 0)
		let testCellsPerRow = 10
		
		//When
		let cell = testCellManager.cellFor(indexPath: testIndexPath, collectionView: testCollectionView, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertFalse(cell.backgroundColor == .black)
	}
	
	
	
	
	
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
	
	
// MARK: - R30CollectionViewCell Tests -
	func testCellGetter_isActive() {
		//Given
		let testCell = R30CollectionViewCell()
		
		//When
		testCell.backgroundColor = .black
		
		//Then
		XCTAssert(testCell.isActivated)
	}
	
	func testCellGetter_isDisabled() {
		//Given
		let testCell = R30CollectionViewCell()
		
		//When
		testCell.backgroundColor = .white
		
		//Then
		XCTAssertFalse(testCell.isActivated)
	}
	
	func testCellSetter_isActive() {
		//Given
		let testCell = R30CollectionViewCell()
		
		//When
		testCell.isActivated = true
		
		//Then
		XCTAssert(testCell.backgroundColor == .black)
	}
	
	func testCellSetter_isDisabled() {
		//Given
		let testCell = R30CollectionViewCell()
		
		//When
		testCell.isActivated = false
		
		//Then
		XCTAssert(testCell.backgroundColor == .white)
	}
}
