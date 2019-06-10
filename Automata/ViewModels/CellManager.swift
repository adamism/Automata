//
//  CellManager.swift
//  Automata
//
//  Created by Ai on 6/9/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit

class CellManager {
	
	func cellFor(indexPath: IndexPath, collectionView: UICollectionView, cellsPerRow: Int) -> UICollectionViewCell {
		let cell = V1CollectionViewCell.dequeue(from: collectionView, at: indexPath)
		
		if isAfterFirstRow(indexPath: indexPath, cellsPerRow: cellsPerRow) {
			let topCellIndexPath = IndexPath.init(item: indexPath.item - cellsPerRow, section: indexPath.section)
			let topLeftCellIndexPath = IndexPath.init(item: topCellIndexPath.item - 1, section: topCellIndexPath.section)
			let topRightCellIndexPath = IndexPath.init(item: topCellIndexPath.item + 1, section: topCellIndexPath.section)
			
			let topCell = collectionView.cellForItem(at: topCellIndexPath) as! V1CollectionViewCell
			let topLeftCell = collectionView.cellForItem(at: topLeftCellIndexPath) as! V1CollectionViewCell
			let topRightCell = collectionView.cellForItem(at: topRightCellIndexPath) as! V1CollectionViewCell
			
			if topLeftCell.isActivated != (topCell.isActivated || topRightCell.isActivated) {
				cell.isActivated = true
			}
		} else if isOriginCell(indexPath: indexPath, cellsPerRow: cellsPerRow) {
			cell.isActivated = true
		}
		
		return cell
	}
	
	func isOriginCell(indexPath: IndexPath, cellsPerRow: Int) -> Bool {
		//OriginCell is the middle of the first row
		return indexPath.item < cellsPerRow && indexPath.item == cellsPerRow / 2
	}

	private func isAfterFirstRow(indexPath: IndexPath, cellsPerRow: Int) -> Bool {
		return indexPath.item - cellsPerRow > 0
	}

}
