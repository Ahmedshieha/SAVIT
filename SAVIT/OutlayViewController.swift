//
//  OutlayViewController.swift
//  SAVIT
//
//  Created by Reda on 12/28/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

     private let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.backgroundColor = .black
        return pageControl
    } ()
    
lazy var VCArr: [UIViewController] = {
    return [self.VCInstance(name: "ViewController1"),
            self.VCInstance(name: "ViewController2"),
            self.VCInstance(name: "ViewController3"),
            self.VCInstance(name: "ViewController4")]
}()

override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    for view in self.view.subviews {
        if view is UIScrollView {
            view.frame = UIScreen.main.bounds
        } else if view is UIPageControl {
            view.backgroundColor = UIColor.clear
        }
    }
}

private func VCInstance(name: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
}

override func viewDidLoad() {
    super.viewDidLoad()
    self.dataSource = self
    self.delegate = self
    view.addSubview(pageControl)
    pageControl.frame = CGRect(x: 10, y: view.frame.size.height-150, width: view.frame.size.width-20, height: 70)
    if let firstVC = VCArr.first {
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
    }
}



public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = VCArr.firstIndex(of: viewController) else {
        return nil
    }

    let previousIndex = viewControllerIndex - 1

    guard previousIndex >= 0 else {
        return VCArr.last
        //uncomment atas comment bawa untuk loop
        //return nil
    }

    guard VCArr.count > previousIndex else {
        return nil
    }

    return VCArr[previousIndex]

}

public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = VCArr.firstIndex(of: viewController) else {
        return nil
    }

    let nextIndex = viewControllerIndex + 1

    guard nextIndex < VCArr.count else {
        return VCArr.first
        //uncomment atas, comment bawah untuk loop
        //return nil
    }

    guard VCArr.count > nextIndex else {
        return nil
    }

    return VCArr[nextIndex]

}

public func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return VCArr.count
}


public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    guard let firstViewController = viewControllers?.first,
          let firstViewControllerIndex = VCArr.firstIndex(of: firstViewController) else {
            return 0
    }

    return firstViewControllerIndex
}


}
