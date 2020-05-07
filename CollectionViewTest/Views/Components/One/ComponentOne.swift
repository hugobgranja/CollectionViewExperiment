//
//  ComponentOne.swift
//  CollectionViewTest
//
//  Created by hg on 05/05/2020.
//  Copyright © 2020 Agentifai. All rights reserved.
//

import UIKit

class ComponentOne: NibView {
    
    @IBOutlet private var widthConstraint: NSLayoutConstraint!
    
    var maxWidth: CGFloat? = nil {
        didSet {
            guard let maxWidth = maxWidth else {
                return
            }
            
            widthConstraint.isActive = true
            widthConstraint.constant = maxWidth
        }
    }
    
}
