//
//  RoundImageView.swift
//  CloudIMTest
//
//  Created by Ian on 15/10/25.
//  Copyright © 2015年 AppCode. All rights reserved.
//

import UIKit
@IBDesignable
class RoundImageView: UIImageView {


    @IBInspectable var myCornerRadius: CGFloat = 0 {
        didSet{
            if myCornerRadius > self.frame.width/2{
                myCornerRadius = self.frame.width/2
            }
            layer.cornerRadius = myCornerRadius
            layer.masksToBounds = myCornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet{
            layer.borderColor = borderColor?.CGColor
        }
    }
    
    

}
