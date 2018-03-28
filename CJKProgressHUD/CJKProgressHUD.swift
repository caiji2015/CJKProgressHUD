//
//  CJKProgressHUD.swift
//  CJKit
//
//  Created by 蔡吉 on 2017/9/18.
//  Copyright © 2017年 caiji. All rights reserved.
//

import UIKit

class CJKProgressHUD: NSObject {
    //MARK: - 这是showSuccess的设置属性
    ///成功消息背景颜色
    var successBackgroundColor: UIColor = .green
    ///成功消息标题颜色
    var successTitleColor: UIColor = .white
    ///成功消息下降时间
    var successStartTime: TimeInterval = 2
    ///成功消息显示时间
    var successMiddleTime: TimeInterval = 2
    
    //MARK: - 这是showError的设置属性
    ///失败消息背景颜色
    var errorBackgroundColor: UIColor = .red
    ///失败消息标题颜色
    var errorTitleColor: UIColor = .white
    ///失败消息下降时间
    var errorStartTime: TimeInterval = 2
    ///失败消息显示时间
    var errorMiddleTime: TimeInterval = 2
    
    //MARK: - loading的设置属性
    var loadingTime: TimeInterval = 0
    
    //MARK: - 默认属性
    /// 单例
    static var shared = CJKProgressHUD()
    /// 当前展示的Window
    fileprivate var tipViews: [UIView] = []
    /// 当前展示的窗口
    fileprivate var window: UIWindow {
        get{
            return UIApplication.currentWindow()
        }
    }
    
    /// 弹出loading
    func loading(){
        loading(time: loadingTime,complete: nil)
    }
    
    /// 错误提示窗
    ///
    /// - Parameters:
    ///   - title: 提示语
    ///   - backgroundColor: 提示窗背景颜色
    ///   - titleColor: 提示语颜色
    ///   - startTime: 下降时间
    ///   - middleTime: 显示时间 为0不消失
    func showError(title: String,complete: (()->Void)? = nil){
        show(title: title, backgroundColor: errorBackgroundColor, titleColor: errorTitleColor, startTime: errorStartTime, middleTime: errorMiddleTime, complete: complete)
    }
    
    /// 成功提示窗
    ///
    /// - Parameters:
    ///   - title: 提示语
    ///   - backgroundColor: 提示窗背景颜色
    ///   - titleColor: 提示语颜色
    ///   - startTime: 下降时间
    ///   - middleTime: 显示时间 为0不消失
    func showSuccess(title: String,complete: (()->Void)? = nil){
        show(title: title, backgroundColor: successBackgroundColor, titleColor: successTitleColor, startTime: successStartTime, middleTime: successMiddleTime, complete: complete)
    }
    
    /// 停止弹窗
    func stop(){
        tipViews.first?.removeFromSuperview()
        tipViews.removeAll()
    }
    
    /// 停止弹窗
    ///
    /// - Parameter complete: 完成操作
    func stop(complete: (()->Void)){
        complete()
        tipViews.first?.removeFromSuperview()
        tipViews.removeAll()
    }
    
    
    /// 弹出提示窗
    ///
    /// - Parameters:
    ///   - title: 提示语
    ///   - backgroundColor: 提示窗背景颜色
    ///   - titleColor: 提示语颜色
    ///   - startTime: 下降时间
    ///   - middleTime: 显示时间 为0不消失
    ///   - complete: 完成回调
    func show(title: String,backgroundColor: UIColor,titleColor: UIColor,startTime: TimeInterval,middleTime: TimeInterval,complete: (()->Void)?){
        /// 判断之前有没有提示窗
        if tipViews.count != 0 {
            tipViews.first?.isHidden = true
            tipViews.first?.removeFromSuperview()
            tipViews.removeAll()
        }
        /// 创建提示窗
        let tipView = initTipView(title: title, backgroundColor: backgroundColor, titleColor: titleColor)
        window.addSubview(tipView)
        tipViews.append(tipView)
        /// 播放弹窗动画
        UIView.animate(withDuration: startTime, animations: {
            tipView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 45+adapterStatusBarHeight)
        }) {[weak self] (bool) in
            if !tipView.isHidden && middleTime != 0{
                /// 完成操作
                if let complete = complete {
                    complete()
                }
                /// 移除弹窗
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + middleTime, execute: {
                    tipView.removeFromSuperview()
                    if let index = self?.tipViews.index(of: tipView){
                        self?.tipViews.remove(at: index)
                    }
                })
            }
        }
    }
    
    /// 弹出loading
    ///
    /// - Parameters:
    ///   - title: 提示语
    ///   - time: 时间
    ///   - complete: 完成回调
    func loading(time: TimeInterval,complete: (()->Void)?){
        if tipViews.count != 0 {
            tipViews.first?.isHidden = true
            tipViews.first?.removeFromSuperview()
            tipViews.removeAll()
        }
        let loadingView = initLoadingView()
        loadingView.center = window.center
        window.addSubview(loadingView)
        tipViews.append(loadingView)

        if time != 0 {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+time, execute: {[weak self] in
                if let complete = complete {
                    complete()
                }
                loadingView.removeFromSuperview()
                if let index = self?.tipViews.index(of: loadingView){
                    self?.tipViews.remove(at: index)
                }
            })
        }
    }
}

extension CJKProgressHUD {
    /// 创建提示窗口
    fileprivate func initTipView(title: String,backgroundColor: UIColor,titleColor: UIColor)-> UIView{
        let tipView = UIView(frame: CGRect(x: 0, y: -40+adapterStatusBarHeight, width: kScreenWidth, height: 45+adapterStatusBarHeight))
        tipView.backgroundColor = backgroundColor
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 20+adapterStatusBarHeight, width: kScreenWidth, height: 20))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = titleColor
        tipView.addSubview(titleLabel)
        return tipView
    }
    
    /// 创建loading窗口
    fileprivate func initLoadingView()-> UIView{
        let view = UIView(frame: kScreenBounds)
        let visualEffectView = UIVisualEffectView(frame: CGRect(x: 0, y: 0, width:80, height: 80))
        let loadView = CJKLoadView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loadView.center = CGPoint(x: visualEffectView.width/2.0, y: visualEffectView.height/2.0)
        visualEffectView.contentView.addSubview(loadView)
        visualEffectView.effect = UIBlurEffect(style: .light)
        visualEffectView.backgroundColor = UIColor.init(white: 0.75, alpha: 0.75)
        visualEffectView.layer.cornerRadius = 15
        visualEffectView.layer.masksToBounds = true
        visualEffectView.center = view.center
        view.addSubview(visualEffectView)
        return view
    }
}
