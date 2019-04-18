//
//  ViewController.swift
//  FocusBarChart
//
//  Created by JGedeon on 2019-04-17.
//  Copyright © 2019 JGedeon. All rights reserved.
//

import UIKit


class FocusBarChartVC: UIViewController {
    
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
        
        setupBarButtonItems()
        
        barChartData.forEach{ bar in
            let grayBarView = BarView(bar)
            stackView.addArrangedSubview(grayBarView)
        }

        view.addSubview(stackView)
        setupConstraintsStackView()
        
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
