//
//  R30CVViewController.swift
//  Automata
//
//  Created by Ai on 6/7/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit
import Foundation

class R30CVViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	private var itemsPerRow: Int = 40
	private var numberOfRows: Int = 0
	private let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
	
	override func viewDidLoad() {
		numberOfRows = itemsPerRow * (itemsPerRow / 2)
	}
}

extension R30CVViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		//Ai: Consider adding a header supplementary view
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		//Ai: Perhaps allow the user to adjust the cell count
		return numberOfRows
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "caCell", for: indexPath)
		
		//Ai: This needs to be cleaned up/easier to digest
		if indexPath.item < itemsPerRow, indexPath.item == itemsPerRow / 2 {
			cell.backgroundColor = .black
		} else if indexPath.item - itemsPerRow > 0 {
			let topCellIndexPath = IndexPath.init(item: indexPath.item - itemsPerRow, section: indexPath.section)
			let topLeftCellIndexPath = IndexPath.init(item: topCellIndexPath.item - 1, section: topCellIndexPath.section)
			let topRightCellIndexPath = IndexPath.init(item: topCellIndexPath.item + 1, section: topCellIndexPath.section)
			
			let topCell = collectionView.cellForItem(at: topCellIndexPath)!
			let topLeftCell = collectionView.cellForItem(at: topLeftCellIndexPath)!
			let topRightCell = collectionView.cellForItem(at: topRightCellIndexPath)!
			
			if isCellEnabled(cell: topLeftCell) != (isCellEnabled(cell: topCell) || isCellEnabled(cell: topRightCell)) {
				cell.backgroundColor = .black
			}
		}
		
		
		return cell
	}
	
	private func isCellEnabled(cell: UICollectionViewCell) -> Bool {
		//Ai: Make an extension of UICollectionViewCell?
		return cell.backgroundColor == .black
	}
}

extension R30CVViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(indexPath.item + 1)
	}
}

extension R30CVViewController : UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let sizePerItem = view.frame.width / CGFloat(itemsPerRow)
		return CGSize(width: sizePerItem, height: sizePerItem)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return sectionInsets
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return sectionInsets.left
	}
}
