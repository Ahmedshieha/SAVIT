//
//  ScrollViewController.swift
//  SAVIT
//
//  Created by Reda on 09/02/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

@available(iOS 13.0, *)

class ScrollViewController: UIViewController,UIScrollViewDelegate {
    var slides :[Slide] = []
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    
    func changeRootViewController(newRootView:UIViewController)
        {
            let mainWindow: UIWindow = UIApplication.shared.windows.first ?? UIWindow()
            mainWindow.rootViewController = newRootView
            mainWindow.makeKeyAndVisible()
        }
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        slides = createsSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            let stortBoard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarViewController = stortBoard.instantiateViewController(withIdentifier: "TabBarViewController")
            changeRootViewController(newRootView: tabBarViewController)
        } else {
            
        }
        
          
    }
   
  
    @objc func buttonAction(sender : UIButton!) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func createsSlides() -> [Slide] {
        
        let slide1 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "undraw_file_analysis_8k9b")
        slide1.lableTitle.text = "Dashboards"
        slide1.labelDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        slide1.setUpSkipButton()
        
        let slide2 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "undraw_personal_finance_tqcd")
        slide2.lableTitle.text = "Accounts"
        slide2.labelDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        slide2.setUpSkipButton()
        
        
        let slide3 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "undraw_Note_list_re_r4u9")
        slide3.lableTitle.text = "Planned Payments"
        slide3.labelDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        slide3.setUpSkipButton()
        
        
        let slide4 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imageView.image = UIImage(named: "undraw_stepping_up_g6oo")
        slide4.lableTitle.text = "Goals"
        slide4.labelDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        slide4.setUpSkipButton()
        
        let slide5 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.imageView.image = UIImage(named: "undraw_goals_w8tw")
        slide5.lableTitle.text = "And many more!"
        slide5.labelDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        slide5.setUpStartButton()
        
        
        
        return[slide1,slide2,slide3,slide4,slide5]
    }
    
    
    func setupSlideScrollView(slides : [Slide]) {
         scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
         scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
         scrollView.isPagingEnabled = true
        
         
         for i in 0 ..< slides.count {
             slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
             scrollView.addSubview(slides[i])
        
         }
     }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x

        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y

        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset


        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)

        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {

            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)

        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)

        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)

        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
    

    

}
