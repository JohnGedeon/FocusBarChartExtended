//
//  FocusBarChartVC+Extension.swift
//  FocusBarChart
//
//  Created by Temp on 4/18/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

extension FocusBarChartVC {
    func setupConstraintsStackView() {
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        stackView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant:0, heightConstant: 300)
    }
    
     func setupBarButtonItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Remove 1", style: .plain, target: self, action: #selector(removeView))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add 1", style: .plain, target: self, action: #selector(addView))
    }
}
