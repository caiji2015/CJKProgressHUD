# CJKProgressHUD
### 这个工具是从导航栏往下弹出提示窗口，您可以设置时间，标题和颜色，也带有加载中窗口。
### 此工具支持swift3.0及以后版本，可以个人需要在控制器生命周期，调用stop方法（因个人需要）

#### 以下是初始化方法，在Demo里也有
```
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
```
