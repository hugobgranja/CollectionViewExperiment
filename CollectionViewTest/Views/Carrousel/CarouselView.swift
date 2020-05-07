//
//  CarouselView.swift
//  Agentifai
//
//  Created by Filipe Pereira on 06/06/2019.
//  Copyright © 2019 Agentifai. All rights reserved.
//

import UIKit

class CarouselView: NibView {

    @IBOutlet private var collectionView: CarouselCollectionView!
    @IBOutlet private var pageControl: UIPageControl!
    @IBOutlet private var collectionViewHeight: NSLayoutConstraint!
    
    func setupView() {
        guard let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout else { return }
        
        var maxHeight : CGFloat = 0
        
        for i in (0...2) {
            let cell = self.collectionView.layoutAttributesForItem(at: IndexPath(item: i, section: 0))
            print("cell frame is \(cell?.frame.height)")
            
            if let height = cell?.frame.height, height > maxHeight {
                maxHeight = height
            }
        }
        
        self.collectionViewHeight.constant = maxHeight
        self.collectionViewHeight.isActive = true
        
        // refresh the height of cell
        
        print("HEIGHT: \(maxHeight)")
    }
    
    private func updateUI() {
        self.collectionView.reloadData()
        self.pageControl.numberOfPages = 3
    }
    
}

extension CarouselView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
}

extension CarouselView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComponentOne", for: indexPath) as! CarouselCollectionViewCell
        
        if cell.isNew() {
            let component = ComponentOne()
            component.translatesAutoresizingMaskIntoConstraints = false
            component.maxWidth = bounds.width - 10
            cell.add(component: component)
        }
        
        return cell
    }

}

extension CarouselView: UICollectionViewDelegateFlowLayout {
    
}
