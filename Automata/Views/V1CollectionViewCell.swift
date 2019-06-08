//
//  AutomataCollectionViewCell.swift
//  Automata
//
//  Created by Ai on 6/8/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit

class V1CollectionViewCell: UICollectionViewCell {
	
	static let identifier = "caCell"
	
	var isActivated: Bool {
		get {
			return self.backgroundColor != .white
		}
		set {
			self.backgroundColor = newValue ? .black : .white
		}
	}

	static func register(with collectionView: UICollectionView) {
		collectionView.register(self, forCellWithReuseIdentifier: identifier)
	}
	
	static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> V1CollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? V1CollectionViewCell ?? V1CollectionViewCell()
		cell.isActivated = false
		return cell
	}
}
