//
//  pageControl.swift
//  alldoit
//
//  Created by LeeYongJin on 12/10/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit

var images = ["1.jpg", "2.jpg", "3.jpg",  "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]

class pageControl: UIViewController {
    
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControlView: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControlView.numberOfPages = images.count
        pageControlView.currentPage = 0
        pageControlView.pageIndicatorTintColor = UIColor.lightGray
        pageControlView.currentPageIndicatorTintColor = UIColor.darkGray
        
        imgView.image = UIImage(named: images[0])

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
        imgView.image = UIImage(named: images[pageControlView.currentPage])
    }
    

   

}
