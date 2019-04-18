//
//  ViewController.swift
//  FocusBarChart
//
//  Created by JGedeon on 2019-04-17.
//  Copyright © 2019 JGedeon. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var stackView = UIStackView(arrangedSubviews: [])
    // this creates a stackView with an empty array of view
    // the arrangedSubviews once populated with views will include
    // them in its internal arrangedSubviews array and its subviews.
    // Calling removeFromSuperView() on one of these views will remove
    // it from the arrangedSubviews and subviews hierarchy.
    
    
    let barChartData = [
        Bar(color: .green, percentage: 0.3),
        Bar(color: .red, percentage: 1),
        Bar(color: .yellow, percentage: 0.9),
        Bar(color: .purple, percentage: 0.6),
        Bar(color: .darkGray, percentage: 0.4),
        Bar(color: .orange, percentage: 0.7),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Remove 1", style: .plain, target: self, action: #selector(removeView))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add 1", style: .plain, target: self, action: #selector(addView))

        barChartData.forEach{ bar in
            let cornerRadius: CGFloat = 4.0
            
            let grayBarView = UIView()
            // this creates a gray scale color of 95% white at full opacity
            grayBarView.backgroundColor = UIColor(white: 0.95, alpha: 1)
            // this only applies to the backgroud color and border of the layer
            // any greater than zero value for the cornerRadius begins to form
            // the a rounded corner. If you want the radius to apply to the layer's
            // image property you have to set masksToBounds causes the content
            // to be clipped to the rouded corners.
            grayBarView.layer.cornerRadius = cornerRadius
                
            let coloredBarView =  UIView()
          
            coloredBarView.backgroundColor = bar.color
            grayBarView.addSubview(coloredBarView)
            coloredBarView.anchor(nil, left: grayBarView.leftAnchor, bottom: grayBarView.bottomAnchor, right: grayBarView.rightAnchor)
        
            coloredBarView.heightAnchor.constraint(equalTo: grayBarView.heightAnchor, multiplier: bar.percentage).isActive = true
            coloredBarView.layer.cornerRadius = cornerRadius
            
            stackView.addArrangedSubview(grayBarView)

        }
        
        stackView.spacing = 8
        stackView.distribution = .fillEqually

        view.addSubview(stackView)
        
        stackView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant:0, heightConstant: 300)
    }
    
    @objc func addView() {
        let bar = Bar.giveMeABar()
        let barView = BarView(bar)
        stackView.addArrangedSubview(barView)
    }
    
    
    @objc func removeView() {
        guard !stackView.subviews.isEmpty else { return }
        stackView.subviews[0].removeFromSuperview()
    }
}
