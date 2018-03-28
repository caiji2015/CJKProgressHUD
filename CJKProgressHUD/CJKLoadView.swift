//
//  CJKLoadView.swift
//  Demo
//
//  Created by 蔡吉 on 2018/3/26.
//  Copyright © 2018年 caiji. All rights reserved.
//

import UIKit

class CJKLoadView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setNeedsDisplay()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        /// 绘制
        let center = CGPoint(x: width/2.0, y: height/2.0)
        var path = UIBezierPath(arcCenter: center, radius: CGFloat(22), startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        UIColor.black.setFill()
        path.lineWidth = 3
        path.stroke()
        path = UIBezierPath(arcCenter: center, radius: CGFloat(15), startAngle: 0, endAngle: CGFloat(Double.pi*2/6), clockwise: true)
        path.lineWidth = 5
        path.stroke()

        /// 旋转
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = Double.pi*2
        animation.duration = 1.25
        animation.autoreverses = false
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = MAXFLOAT
        layer.add(animation, forKey: nil)
    }
}
