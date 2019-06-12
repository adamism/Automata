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
	private var cellSize: CGFloat = 0
	@IBInspectable var cellsPerRow: Int = 9
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		R30CollectionViewCell.register(with: collectionView)
		
		cellSize = collectionView.frame.width / CGFloat(cellsPerRow)
		
		//Because the collectionView starts at x:0, y:0, to truly center the view,
		//we need to shift the entire thing half a cell to the left.
		collectionView.transform = CGAffineTransform(translationX: -(cellSize / 2), y: 0)
	}
}

// MARK: - UICollectionViewDataSource -
extension R30ViewController: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cellsPerRow * (cellsPerRow / 2)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell = UICollectionViewCell.init()
		
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		if let cellManager = appDelegate.cellManager {
			cell = cellManager.cellFor(indexPath: indexPath, collectionView: collectionView, cellsPerRow: cellsPerRow)
		} else {
			print("appDelegate.cellManager is nil")
		}
		
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout -
extension R30ViewController : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: cellSize, height: cellSize)
	}
}
