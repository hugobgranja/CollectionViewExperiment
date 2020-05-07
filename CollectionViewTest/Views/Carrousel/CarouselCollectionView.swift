//
//  CarouselCollectionView.swift
//  Agentifai
//
//  Created by Filipe Pereira on 06/06/2019.
//  Copyright © 2019 Agentifai. All rights reserved.
//

import UIKit

class CarouselCollectionView: UICollectionView {

    let identifiers = ["ComponentOne", "ComponentTwo"]
   
//    override var intrinsicContentSize: CGSize {
//        let size = CGSize(width: bounds.width, height: height ?? 0)
//        print("itemSize: \(size)")
//        return size
//    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.registerCells()
        let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    private func registerCells() {
        for identifier in identifiers {
            self.register(
                UINib(
                    nibName: "CarouselCollectionViewCell",
                    bundle: Bundle(for: CarouselCollectionViewCell.self)
                ),
                forCellWithReuseIdentifier: identifier
            )
        }
    }

}
