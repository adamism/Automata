//
//  IntroViewController.swift
//  Automata
//
//  Created by Ai on 6/8/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
	
	@IBOutlet weak var logoImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	
	private let readmeFileName = "readme.txt"
	
	override func viewDidLoad() {
		if let filepath = Bundle.main.path(forResource: readmeFileName, ofType: "txt") {
			do {
				let contents = try String(contentsOfFile: filepath)
				print(contents)
			} catch {
				print("Failed to load contents of \(filepath)")
			}
		} else {
			print("Failed to load contents of \(readmeFileName)")
		}

	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		animateLogo()
		animateContent()
		startAnimatingBackground()
	}
			private func animateLogo() {
				if isFirstViewCycle() {
					UIView.animate(withDuration: 0.3, delay: 0.2, options: UIView.AnimationOptions.curveEaseInOut, animations: {
						self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -10)
						self.logoImageView.alpha = 0.0
					}, completion: nil)
				}
			}
			
			private func animateContent() {
				if isFirstViewCycle() {
					titleLabel.alpha = 0.0
					titleLabel.isHidden = false
				
					UIView.animateKeyframes(withDuration: 0.6, delay: 0.2, options: [], animations: {
						UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
							self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -30)
							self.titleLabel.alpha = 1.0
						})
						UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
//							self.readMeView.transform = CGAffineTransform(translationX: 0, y: -25)
//							self.readMeView.alpha = 0.0
						})
					}, completion: nil)
				}
			}
	
	private func isFirstViewCycle() -> Bool {
		return titleLabel.isHidden
	}
	
	private func startAnimatingBackground() {
		
	}
}
