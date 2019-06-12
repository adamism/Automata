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
		if let downView = try? DownView(frame: .zero, markdownString: getReadMeContents(), openLinksInBrowser: true) {
			markDownView.addSubview(downView)
			downView.translatesAutoresizingMaskIntoConstraints = false
			downView.topAnchor.constraint(equalTo: markDownView.topAnchor, constant: 0).isActive = true
			downView.leftAnchor.constraint(equalTo: markDownView.leftAnchor, constant: 0).isActive = true
			downView.bottomAnchor.constraint(equalTo: markDownView.bottomAnchor, constant: 0).isActive = true
			downView.rightAnchor.constraint(equalTo: markDownView.rightAnchor, constant: 0).isActive = true
		} else {
			print("Failed to load DownView")
		}
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
