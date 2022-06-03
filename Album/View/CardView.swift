//
//  CardView.swift
//  Album
//
//  Created by apple on 6/2/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CardView: UIView {
    var cornerRadius:CGFloat = 10
    var shadowColor:UIColor? = UIColor.black
    var shadowOffsetWidth:Int = 0
    var shadowOffsetHeight:Int = 1
    var shadowOpacity:Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
    
}
