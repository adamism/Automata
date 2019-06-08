//
//  AutomataCollectionViewCell.swift
//  Automata
//
//  Created by Ai on 6/8/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit

class V2CollectionViewCell: UICollectionViewCell {
	
	static let identifier = "caCell"
	
	var isActivated: Bool {
		get {
			return self.backgroundColor != .white
		}
		set {
			self.backgroundColor = newValue ? .green : .white
		}
	}
	
	static func register(with collectionView: UICollectionView) {
		collectionView.register(self, forCellWithReuseIdentifier: identifier)
	}
	
	static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> V2CollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? V2CollectionViewCell ?? V2CollectionViewCell()
		cell.isActivated = false
		return cell
	}
}
