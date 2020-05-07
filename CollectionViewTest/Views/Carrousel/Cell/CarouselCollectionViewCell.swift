//
//  CarouselCollectionViewCell.swift
//  Agentifai
//
//  Created by hg on 28/04/2020.
//  Copyright © 2020 Agentifai. All rights reserved.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var stackView: UIStackView!
    private var component: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func isNew() -> Bool {
        return component == nil
    }
    
    func add(component: UIView) {
        self.stackView.addArrangedSubview(component)
    }

}
