//
//  IntroViewController.swift
//  Automata
//
//  Created by Ai on 6/8/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit
import Down

class IntroViewController: UIViewController {
	
	@IBOutlet weak var logoImageView: UIImageView!
	@IBOutlet weak var markDownView: UIView!
	
	private let readmeFileName = "README"
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if isFirstViewCycle() {
			animateLogo()
			showReadMe()
			startAnimatingBackground()
		}
	}
	
	private func animateLogo() {
		UIView.animate(withDuration: 0.2, delay: 0.5, options: UIView.AnimationOptions.curveEaseInOut, animations: {
			self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -10)
			self.logoImageView.alpha = 0.0
		}, completion: { _ in
			self.logoImageView.bottomAnchor.constraint(equalTo: self.markDownView.topAnchor).isActive = true
			
			UIView.animate(withDuration: 0.4) {
				self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -30)
				self.logoImageView.alpha = 1.0
			}
		})
	}
	
	private func showReadMe() {
		let downView = try? DownView(frame: markDownView.bounds, markdownString: getReadMeContents()) { }

		markDownView.addSubview(downView!)
		markDownView.isHidden = false
		markDownView.alpha = 0.0
		
		UIView.animate(withDuration: 0.2, delay: 0.5, options: UIView.AnimationOptions.curveEaseInOut, animations: {
			self.markDownView.transform = CGAffineTransform(translationX: 0, y: -20)
			self.markDownView.alpha = 1.0
		}, completion: nil)
	}

	private func getReadMeContents() -> String {
		var contents: String = "Readme"
		if let filepath = Bundle.main.path(forResource: readmeFileName, ofType: "md") {
			do {
				contents = try String(contentsOfFile: filepath)
			} catch {
				print("Failed to load contents of \(filepath)")
			}
		} else {
			print("Failed to load contents of \(readmeFileName)")
		}
		
		return contents
	}
	
	private func isFirstViewCycle() -> Bool {
		return markDownView.isHidden
	}
	
	private func startAnimatingBackground() {
		
	}
}
