//
//  CJKColor+extension.swift
//  CJKit
//
//  Created by 蔡吉 on 2017/7/31.
//  Copyright © 2017年 caiji. All rights reserved.
//

import UIKit

extension UIColor {
    /// 随机数
    public class func random() -> UIColor{
        let red = CGFloat(arc4random_uniform(255) + 1) / 255.0
        let green = CGFloat(arc4random_uniform(255) + 1) / 255.0
        let blue = CGFloat(arc4random_uniform(255) + 1) / 255.0
        let random = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return random
    }
    
    /// rgb生成色
    public convenience init(r: CGFloat,g: CGFloat,b: CGFloat,a: CGFloat = 1) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    /// 十六进制生成色
    public convenience init(rgb: Int, alpha: CGFloat = 1) {
        let r = CGFloat((rgb >> 16) & 0xFF)
        let g = CGFloat((rgb >> 8) & 0xFF)
        let b = CGFloat(rgb & 0xFF)
        self.init(r: r, g: g, b: b, a: alpha)
    }
}
