# WMCircleProgressView
圆形进度条，方便改写
图片如下：

[效果图](https://github.com/WMSmile/WMCircleProgressView/tree/master/Screenshots/circle.png)
[效果图](https://github.com/WMSmile/WMCircleProgressView/tree/master/Screenshots/circle.gif)
###WMCircleProgressView用法：
```
  self.circleView = WMCircleProgressView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        circleView?.lineWidth = 10
        circleView?.centerLabel?.font = UIFont.systemFont(ofSize: 50);
        self.view.addSubview(circleView!)
        circleView?.center = self.view.center

```