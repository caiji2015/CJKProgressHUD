//
//  CJKApplication+extension.swift
//  CJKit
//
//  Created by 蔡吉 on 2017/8/2.
//  Copyright © 2017年 caiji. All rights reserved.
//

import UIKit

extension UIApplication{
    /// 当前界面显示的UIViewController
    public class func currentViewController() -> UIViewController?{
        if var viewController = UIApplication.currentWindow().rootViewController{
            while true {
                if viewController is UITabBarController {
                    viewController = (viewController as! UITabBarController).selectedViewController!
                }
                if viewController is UINavigationController {
                    viewController = (viewController as! UINavigationController).visibleViewController!
                }
                if (viewController.presentedViewController != nil) {
                    viewController = viewController.presentedViewController!
                }else{
                    break
                }
            }
            return viewController
        }
        return nil
    }
    
    /// 当前界面显示的window
    public class func currentWindow() -> UIWindow{
        var window = UIApplication.shared.keyWindow!
        ///判断是否当前的window
        if (window.windowLevel != UIWindowLevelNormal) {
            for tmpWindow in UIApplication.shared.windows {
                if tmpWindow.windowLevel == UIWindowLevelNormal {
                    window = tmpWindow
                    break
                }
            }
        }
        return window
    }
    
    ///根据版本openURL
    public class func open(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [UIApplicationOpenURLOptionUniversalLinksOnly : true])
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
