//
//  R30ViewController.swift
//  Automata
//
//  Created by Ai on 6/7/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit
import Foundation

@objc enum r30Version: Int {
	case v1 = 1
	case v2 = 2
}

class R30ViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	private var timer = Timer()
	private let cellID = "v1Cell"
	private var cellSize: CGFloat = 0
	private var cellTotal: Int = 0
	@IBInspectable var cellsPerRow: Int = 9
	@IBInspectable var r30ViewControllerVersion: r30Version = .v1
	@IBInspectable var ruleNumber: Int = 30
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		R30CollectionViewCell.register(with: collectionView)
		
		cellTotal = cellsPerRow
		cellSize = collectionView.frame.width / CGFloat(cellTotal)
		
		//Because the collectionView starts at x:0, y:0, to truly center the view,
		//we need to shift the entire thing half a cell to the left.
		collectionView.transform = CGAffineTransform(translationX: -(cellSize / 2), y: 0)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		buildGrid()
	}
	
	private func buildGrid() {
		if r30ViewControllerVersion == .v2 {
			generateTimedGrid()
		} else {
			generateFullGrid()
		}
	}
	
	private func generateTimedGrid() {
		timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: Selector("addCell"), userInfo: nil, repeats: true)
	}
	
	private func stopTimer() {
		timer.invalidate()
	}
	
	private func generateFullGrid() {
		if cellTotal < (cellsPerRow * cellsPerRow / 2) {
			cellTotal = cellsPerRow * cellsPerRow / 2
			collectionView.reloadData()
		}
	}
	
	@objc public func addCell() {
		if cellTotal < (cellsPerRow * cellsPerRow / 2) {
			cellTotal += 1
			collectionView.reloadData()
		} else {
			stopTimer()
		}
	}
}

// MARK: - UICollectionViewDataSource -
extension R30ViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cellTotal
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
