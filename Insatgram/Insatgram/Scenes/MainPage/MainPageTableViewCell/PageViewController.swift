//
//  PageViewController.swift
//  Insatgram
//
//  Created by Mac User on 23.11.24.
//

import UIKit
 
class PageViewController: UIViewController, UIPageViewControllerDataSource {
 
    var pageViewController: UIPageViewController!
    var pages: [UIViewController] = []
    var pages1: [UIImageView] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
 
        // 1. შექმენით გვერდების ViewController-ები
        let firstPage = ContentViewController(text: "Page 1", color: .red)
        let secondPage = ContentViewController(text: "Page 2", color: .green)
        let thirdPage = ContentViewController(text: "Page 3", color: .blue)
        
//        let firstPage1 = UIImageView()
//        firstPage1.image = UIImage(named: "MainPagePostAutorPhoto")
//        let firstPage2 = UIImageView()
//        firstPage2.image = UIImage(named: "MainPagePostAutorPhoto")
//        let firstPage3 = UIImageView()
//        firstPage3.image = UIImage(named: "MainPagePostAutorPhoto")
        
 
        pages = [firstPage, secondPage, thirdPage]
        //pages = [firstPage1, firstPage2, firstPage3]
        // 2. დააინიციალეთ UIPageViewController
        pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
        pageViewController.dataSource = self
 
        // 3. დაამატეთ საწყისი გვერდი
        pageViewController.setViewControllers(
            [pages[0]],
            direction: .forward,
            animated: true,
            completion: nil
        )
 
        // 4. დაამატეთ PageViewController თქვენს ხედს
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.frame = view.bounds
        pageViewController.didMove(toParent: self)
    }
 
    // MARK: - UIPageViewControllerDataSource
 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }
 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}
 
class ContentViewController: UIViewController {
    init(text: String, color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = color
 
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
 
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
