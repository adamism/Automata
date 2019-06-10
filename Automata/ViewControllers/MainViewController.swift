//
//  MainViewController.swift
//  Automata
//
//  Created by Ai on 6/9/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	@IBOutlet weak var logoImageView: UIImageView!
	@IBOutlet weak var containerView: UIView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		animateLogo()
    }

	private func animateLogo() {
		UIView.animate(withDuration: 0.1, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
			self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -5)
			self.logoImageView.alpha = 0.0
		}, completion: { _ in
			self.logoImageView.bottomAnchor.constraint(equalTo: self.containerView.topAnchor, constant: -25).isActive = true
			UIView.animate(withDuration: 0.2) {
				self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -5)
				self.logoImageView.alpha = 1.0
			}
		})
	}
}
