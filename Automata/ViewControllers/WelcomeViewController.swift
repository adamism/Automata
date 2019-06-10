//
//  WelcomeViewController.swift
//  Automata
//
//  Created by Ai on 6/9/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

	@IBOutlet weak var welcomeLabel: UILabel!
	@IBOutlet weak var textView1: UITextView!
	@IBOutlet weak var textView2: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		//Setting this here because it's set to white on the storyboard for easier editing.
		view.backgroundColor = .clear

		animateScene()
	}
	
	private func animateScene() {
		//Setup
		self.welcomeLabel.alpha = 0.0
		self.textView1.alpha = 0.0
		self.textView2.alpha = 0.0
		
		//Animate
		//Didn't have much luck using UIView.animateKeyframes here.
		//The relative timing options didn't respond as expected.
		//Ordering events by delay worked much more predictably.
		UIView.animate(withDuration: 0.2, delay: 1.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
			self.welcomeLabel.alpha = 1.0
		}, completion: nil)
		
		UIView.animate(withDuration: 0.2, delay: 2.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
			self.textView1.alpha = 1.0
		}, completion: nil)
		
		UIView.animate(withDuration: 0.2, delay: 7.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
			self.textView2.alpha = 1.0
		}, completion: nil)
	}
}
