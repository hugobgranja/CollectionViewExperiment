//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by hg on 04/05/2020.
//  Copyright © 2020 Agentifai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var carouselView: CarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("wat")
        carouselView.setupView()
    }
    
}

