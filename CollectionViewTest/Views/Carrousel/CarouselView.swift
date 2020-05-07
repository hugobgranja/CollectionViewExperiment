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
        let height = delegate.collectionView?(collectionView, layout: collectionView.collectionViewLayout, sizeForItemAt: IndexPath(item: 0, section: 0)).height
        self.collectionViewHeight.constant = height ?? 0
        self.collectionViewHeight.isActive = true
        print("HEIGHT: \(height)")
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
