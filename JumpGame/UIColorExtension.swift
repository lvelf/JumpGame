//
//  UIColorExtension.swift
//  JumpGame
//
//  Created by 诺诺诺诺诺 on 2022/10/2.
//

import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor{
        let r = CGFloat.random(in: 0...1)
        let g = CGFloat.random(in: 0...1)
        let b = CGFloat.random(in: 0...1)
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
