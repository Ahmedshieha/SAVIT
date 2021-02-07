//
//  DashBoardViewController.swift
//  SAVIT
//
//  Created by Reda on 04/02/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import UIKit
import Foundation
class DashBoardViewController: UIPageViewController {
    
    let button = UIButton()
    fileprivate lazy var pages : [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "ViewController1"),
            self.getViewController(withIdentifier: "ViewController2"),
            self.getViewController(withIdentifier: "ViewController3"),
            self.getViewController(withIdentifier: "ViewController4"),
            self.getViewController(withIdentifier: "ViewController5"),
        
        ]
    }()
     
    fileprivate func getViewController (withIdentifier identifier:String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    private func supView() {
        button.frame = CGRect(x: 161, y: 692, width: 110, height: 30)
        button.backgroundColor = .black
        button.setTitle("Skip", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender : UIButton!) {
        print("Skip")
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.view.backgroundColor = .white
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            
            
        }
        // Do any additional setup after loading the view.
        supView()
        
    }
    
}

extension DashBoardViewController : UIPageViewControllerDataSource {
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    
        func pageViewController(_ pageViewController : UIPageViewController , viewControllerBefore viewController : UIViewController) -> UIViewController? {
            guard let viewControolerIndex = pages.firstIndex(of: viewController)
            else {return nil}
            let previousIndex = viewControolerIndex - 1
            guard previousIndex >= 0 else {return nil}
            guard pages.count > previousIndex else {return nil}
            return pages [previousIndex]
            
            
        }
   

        func pageViewController(_ pageViewController : UIPageViewController , viewControllerAfter viewController : UIViewController) -> UIViewController? {
            guard let viewControolerIndex = pages.firstIndex(of: viewController)else {return nil}
            let nextIndex = viewControolerIndex + 1
            guard nextIndex < pages.count else {return nil}
            return pages [nextIndex]

        }
    
    
    
}
extension DashBoardViewController : UIPageViewControllerDelegate {}


