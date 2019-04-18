//
//  BarView.swift
//  FocusBarChart
//
//  Created by JGedeon on 4/18/19.
//  Copyright © 2019 JGedeon. All rights reserved.
//

import UIKit

class BarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(_ bar: Bar) {
        self.init()
        self.configureView(bar: bar)
    }
    
    private func configureView(bar: Bar) {
       
        let cornerRadius: CGFloat = 4.0
        
       
        // this creates a gray scale color of 95% white at full opacity
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        // this only applies to the backgroud color and border of the layer
        // any greater than zero value for the cornerRadius begins to form
        // the a rounded corner. If you want the radius to apply to the layer's
        // image property you have to set masksToBounds causes the content
        // to be clipped to the rouded corners.
        layer.cornerRadius = cornerRadius
        
        let coloredBarView =  UIView()
        
        coloredBarView.backgroundColor = bar.color
        self.addSubview(coloredBarView)
        coloredBarView.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
        
        coloredBarView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: bar.percentage).isActive = true
        coloredBarView.layer.cornerRadius = cornerRadius
        
    }
}
