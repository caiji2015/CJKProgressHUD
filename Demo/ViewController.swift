//
//  ViewController.swift
//  Demo
//
//  Created by 蔡吉 on 2018/2/27.
//  Copyright © 2018年 caiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func showSuccess(_ sender: UIButton) {
        CJKProgressHUD.shared.showSuccess(title: "订购成功")
        
    }
    @IBAction func showError(_ sender: UIButton) {
        CJKProgressHUD.shared.showError(title: "订购失败")
    }
    @IBAction func loading(_ sender: UIButton) {
        CJKProgressHUD.shared.loading()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
            CJKProgressHUD.shared.stop()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///初始化(example)
        ///成功属性
        CJKProgressHUD.shared.successBackgroundColor = .green
        CJKProgressHUD.shared.successTitleColor = .white
        CJKProgressHUD.shared.successStartTime = 2
        CJKProgressHUD.shared.successMiddleTime = 2
        ///失败属性
        CJKProgressHUD.shared.errorBackgroundColor = .red
        CJKProgressHUD.shared.errorTitleColor = .white
        CJKProgressHUD.shared.errorStartTime = 2
        CJKProgressHUD.shared.errorMiddleTime = 2
    }
}
