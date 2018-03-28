//
//  CJKView+extension.swift
//  CJKit
//
//  Created by 蔡吉 on 2017/7/31.
//  Copyright © 2017年 caiji. All rights reserved.
//

import UIKit

extension UIView{
    /// 读写x
    var x: CGFloat{
        get{
            return frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = x
            self.frame = frame
        }
    }
    
    /// 读写y
    var y: CGFloat{
        get{
            return frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = y
            self.frame = frame
        }
    }

    /// 读写width
    var width: CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.size.width = width
            self.frame = frame
        }
    }
    
    /// 读写 height
    var height: CGFloat{
        get{
            return self.frame.size.height
        }
        set(height){
            var frame = self.frame
            frame.size.height = height
            self.frame = frame
        }
    }

    /// 读写 size
    var size: CGSize{
        get{
            return self.frame.size
        }
        set(size){
            var frame = self.frame
            frame.size = size
            self.frame = frame
        }
    }
    
    /// 读写origin
    var origin: CGPoint{
        get{
            return self.frame.origin
        }
        set(origin){
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
        }
    }
    
    /// 读写centerX
    var centerX: CGFloat{
        get{
            return self.center.x
        }
        set{
            var center = self.center
            center.x = centerX
            self.center = center
        }
    }
    
    /// 读写centerY
    var centerY: CGFloat{
        get{
            return self.center.y
        }
        set{
            var center = self.center
            center.y = centerY
            self.center = center
        }
    }
}
