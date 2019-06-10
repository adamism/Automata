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
		let downViewFrame = CGRect(x: 0, y: 0, width: markDownView.frame.width, height: markDownView.frame.height)
		let downView = try? DownView(frame: downViewFrame, markdownString: getReadMeContents()) { }
		
		markDownView.addSubview(downView!)
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
