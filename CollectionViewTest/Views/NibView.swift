//
//  NibView.swift
//  Agentifai
//
//  Created by Filipe Pereira on 09/07/2018.
//  Copyright © 2018 Filipe Pereira. All rights reserved.
//

import UIKit

class NibView: UIView {
    
    var xibView: UIView?
    
    var nibName: String {
        return String(describing: type(of: self))
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        self.createConstraints(xibView: view)
        self.xibView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let metatype = type(of: self)
        let bundle = Bundle(for: metatype)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func createConstraints(xibView: UIView) {
        self.addSubview(xibView)
        xibView.translatesAutoresizingMaskIntoConstraints = false
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addConstraints(NSLayoutConstraint.pin(view: xibView))
    }
    
}

extension NSLayoutConstraint {
    
    static func create(withVisualFormat format: String, view: UIView) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(
            withVisualFormat: format,
            options: [.directionLeadingToTrailing],
            metrics: nil,
            views: ["view": view]
        )
    }
    
    static func pin(view: UIView, topMargin: Int = 0, bottomMargin: Int = 0, leadingMargin: Int = 0, trailingMargin: Int = 0) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        let metrics = ["topMargin": topMargin,
                       "bottomMargin": bottomMargin,
                       "leadingMargin": leadingMargin,
                       "trailingMargin": trailingMargin]
        
        let views = ["view": view]
        
        constraints.append(contentsOf:
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-leadingMargin-[view]-trailingMargin-|",
                options: [.directionLeadingToTrailing],
                metrics: metrics,
                views: views
            )
        )
        
        constraints.append(contentsOf:
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-topMargin-[view]-bottomMargin-|",
                options: [.directionLeadingToTrailing],
                metrics: metrics,
                views: views
            )
        )
        
        return constraints
    }
    
}
