//
//  IntroViewController.swift
//  Automata
//
//  Created by Ai on 6/8/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit
import Down

class ReadMeViewController: UIViewController {
	
	@IBOutlet weak var markDownView: UIView!
	
	private let readmeFileName = "README"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		showReadMe()
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
}
