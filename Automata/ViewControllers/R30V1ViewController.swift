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
	
	private let cellID = "v1Cell"
	
	@IBInspectable var cellsPerRow: Int = 9
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		V1CollectionViewCell.register(with: collectionView)
	}
}

// MARK: - UICollectionViewDataSource -
extension R30ViewController: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		//Ai: Perhaps allow the user to adjust the cell count
		return cellsPerRow * (cellsPerRow / 2)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell = UICollectionViewCell.init()
		
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		if let cellManager = appDelegate.cellManager {
			cell = cellManager.cellFor(indexPath: indexPath, collectionView: collectionView, cellsPerRow: cellsPerRow)
		}
		
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout -
extension R30ViewController : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let sizePerItem = collectionView.frame.width / CGFloat(cellsPerRow)
		return CGSize(width: sizePerItem, height: sizePerItem)
	}
}
