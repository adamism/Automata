//
//  R30CVViewController.swift
//  Automata
//
//  Created by Ai on 6/7/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit
import Foundation

class R30ViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	private let cellID = "caCell"
	private var itemsPerRow: Int = 40
	private var numberOfRows: Int = 0
	
	override func viewDidLoad() {
		AutomataCollectionViewCell.register(with: collectionView)
		numberOfRows = itemsPerRow * (itemsPerRow / 2)
	}
}

// MARK: - UICollectionViewDataSource -
extension R30ViewController: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		//Ai: Perhaps allow the user to adjust the cell count
		return numberOfRows
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return cellFor(indexPath: indexPath)
	}

	// MARK: - UICollectionViewDataSoure Helpers -
	private func cellFor(indexPath: IndexPath) -> UICollectionViewCell {
		let cell = AutomataCollectionViewCell.dequeue(from: collectionView, at: indexPath)
		
		if isAfterFirstRow(indexPath: indexPath) {
			let topCellIndexPath = IndexPath.init(item: indexPath.item - itemsPerRow, section: indexPath.section)
			let topLeftCellIndexPath = IndexPath.init(item: topCellIndexPath.item - 1, section: topCellIndexPath.section)
			let topRightCellIndexPath = IndexPath.init(item: topCellIndexPath.item + 1, section: topCellIndexPath.section)
			
			let topCell = collectionView.cellForItem(at: topCellIndexPath) as! AutomataCollectionViewCell
			let topLeftCell = collectionView.cellForItem(at: topLeftCellIndexPath) as! AutomataCollectionViewCell
			let topRightCell = collectionView.cellForItem(at: topRightCellIndexPath) as! AutomataCollectionViewCell
			
			if topLeftCell.isActivated != (topCell.isActivated || topRightCell.isActivated) {
				cell.isActivated = true
			}
		} else if isOriginCell(indexPath: indexPath) {
			cell.isActivated = true
		}

		return cell
	}
	
	private func isOriginCell(indexPath: IndexPath) -> Bool {
		//OriginCell is the middle of the first row
		return indexPath.item < itemsPerRow && indexPath.item == itemsPerRow / 2
	}
	
	private func isAfterFirstRow(indexPath: IndexPath) -> Bool {
		return indexPath.item - itemsPerRow > 0
	}
}

// MARK: - UICollectionViewDelegateFlowLayout -
extension R30ViewController : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let sizePerItem = view.frame.width / CGFloat(itemsPerRow)
		return CGSize(width: sizePerItem, height: sizePerItem)
	}
}
