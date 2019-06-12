//
//  PageViewController.swift
//  Automata
//
//  Created by Ai on 6/8/19.
//  Copyright © 2019 Ai. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

	private let storyboardId = "Main"
	private var pageControl = UIPageControl()
	lazy private var orderedViewControllers: [UIViewController] = {
		return [newVc(viewController: "welcome"),
				newVc(viewController: "rule30v1"),
				newVc(viewController: "rule30v2"),
				newVc(viewController: "rule30v3"),
				newVc(viewController: "readMe")]
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.delegate = self
		self.dataSource = self
		
		if let firstViewController = orderedViewControllers.first {
			setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
		} else {
			print("Something went wrong getting the ViewController array.")
		}
		
		configurePageControl()
    }
	
	// MARK: - Helpers -
	private func newVc(viewController: String) -> UIViewController {
		return UIStoryboard(name: storyboardId, bundle: nil).instantiateViewController(withIdentifier: viewController)
	}
	
	private func configurePageControl() {
		pageControl = UIPageControl(frame: CGRect(x: 0,y: 0, width: view.bounds.width, height: 50))
		pageControl.numberOfPages = orderedViewControllers.count
		pageControl.currentPage = 0
		pageControl.tintColor = UIColor.black
		pageControl.pageIndicatorTintColor = UIColor.lightGray
		pageControl.currentPageIndicatorTintColor = UIColor.black
		pageControl.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(pageControl)
		
		// The action of using a swipe to progress through the app is essential.
		// Raising the PageControl slightly, will hopefully ensure the user notices it's presence.
		pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
		pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
	}
}

// MARK: - PageView Data Source -
extension PageViewController: UIPageViewControllerDataSource {
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }

		let previousIndex = viewControllerIndex - 1

		guard previousIndex >= 0 else { return nil }
		guard orderedViewControllers.count > previousIndex else { return nil }
		
		return orderedViewControllers[previousIndex]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
		
		let nextIndex = viewControllerIndex + 1
		let orderedViewControllersCount = orderedViewControllers.count

		guard orderedViewControllersCount != nextIndex else { return nil }
		guard orderedViewControllersCount > nextIndex else { return nil }
		
		return orderedViewControllers[nextIndex]
	}
}

// MARK: - PageView Delegate -
extension PageViewController: UIPageViewControllerDelegate {

	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		let pageContentViewController = pageViewController.viewControllers![0]
		self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
	}
}
