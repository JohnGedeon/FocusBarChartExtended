//
//  Bar.swift
//  FocusBarChart
//
//  Created by JGedeon on 4/18/19.
//  Copyright © 2019 JGedeon. All rights reserved.
//

import UIKit

struct Bar {
    let color: UIColor
    let percentage: CGFloat
    
    static func giveMeABar() -> Bar {
        let percentageRandom = CGFloat.random(in: 0 ... 1)
        let colorRandom: UIColor = randomColor.randomElement() ?? .white
        
        return Bar(color: colorRandom, percentage: percentageRandom)
    }

    static let randomColor: [UIColor] = [
        .black,.darkGray,.lightGray,.white,.gray,
        .red,.green,.blue,.cyan,.yellow,
        .magenta,.orange,.purple,.brown,.clear
    ]
}
