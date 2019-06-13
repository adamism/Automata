//
//  CellManagerTests.swift
//  AutomataTests
//
//  Created by Ai on 6/7/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import XCTest
@testable import Automata

class CellManagerTests: XCTestCase {

	var testLayout: UICollectionViewLayout!
	var testCollectionView: UICollectionView!
	var testCellManager: CellManager!

    override func setUp() {
		testLayout = UICollectionViewLayout()
		testCollectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0)), collectionViewLayout: testLayout)
		testCellManager = CellManager.init()
		R30CollectionViewCell.register(with: testCollectionView)
    }
	
	func testCellFor_Activates_OriginCell() {
		//Given
		let testIndexPath =  IndexPath(item: 5, section: 0)
		let testCellsPerRow = 10
		
		//When
		let cell = testCellManager.cellFor(indexPath: testIndexPath, collectionView: testCollectionView, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssert(cell.backgroundColor == .black)
	}

	func testCellFor_DoesNotActivate_FirstRowNonMiddleCell() {
		//Given
		let testIndexPath =  IndexPath(item: 3, section: 0)
		let testCellsPerRow = 10
		
		//When
		let cell = testCellManager.cellFor(indexPath: testIndexPath, collectionView: testCollectionView, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertFalse(cell.backgroundColor == .black)
	}
	
	func testIsOriginCell_NotMiddleCell() {
		//Given
		let testIndexPath =  IndexPath(item: 2, section: 0)
		let testCellsPerRow = 10
		
		//When
		let isOrigin = testCellManager.isOriginCell(indexPath: testIndexPath, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertFalse(isOrigin)
	}
	
	func testIsOriginCell_MiddleCell_EvenNumber() {
		//Given
		let testIndexPath =  IndexPath(item: 5, section: 0)
		let testCellsPerRow = 10
		
		//When
		let isOrigin = testCellManager.isOriginCell(indexPath: testIndexPath, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertTrue(isOrigin)
	}
	
	func testIsOriginCell_MiddleCell_OddNumberRoundsDown() {
		//Given
		let testIndexPath =  IndexPath(item: 4, section: 0)
		let testCellsPerRow = 9
		
		//When
		let isOrigin = testCellManager.isOriginCell(indexPath: testIndexPath, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertTrue(isOrigin)
	}
	
	func testIsOriginCell_MiddleCell_OddNumberDoesNotRoundUp() {
		//Given
		let testIndexPath =  IndexPath(item: 5, section: 0)
		let testCellsPerRow = 9
		
		//When
		let isOrigin = testCellManager.isOriginCell(indexPath: testIndexPath, cellsPerRow: testCellsPerRow)
		
		//Then
		XCTAssertFalse(isOrigin)
	}
}
