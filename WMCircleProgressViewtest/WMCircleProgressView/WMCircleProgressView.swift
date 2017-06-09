//
//  WMCircleProgressView.swift
//  WMCircleProgressViewtest
//
//  Created by apple on 2017/6/9.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

class WMCircleProgressView: UIView {
    
    var centerLabel:UILabel?
    var progressView:WMBaseCircleView?
    var centerTitle:String = ""
    {
        didSet{
            updateTitle()
        }
    }
    //linewidth
    var lineWidth:CGFloat = 4.0
    {
        didSet
        {
            updateLineWidth()
        }
    }
    //progress
    var progress:CGFloat = 0.0
    {
        didSet
        {
            updateProgress()
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- init
    func initViews() -> Void {
        
        self.progressView = WMBaseCircleView.init(frame: self.frame);
        self.addSubview(progressView!);
        
        self.centerLabel = UILabel.init();
        centerLabel?.center = self.center;
        centerLabel?.bounds = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height);
        centerLabel?.textAlignment = .center
        self.addSubview(centerLabel!);
        
        
    }

    func updateProgress() -> Void {
        self.progressView?.progress = progress;
        self.centerLabel?.bounds = CGRect(x: 0, y: 0, width: self.frame.size.width-lineWidth, height: self.frame.size.height-lineWidth);

    }
    
    func updateLineWidth() -> Void {
        self.progressView?.lineWidth = lineWidth;
       
    }

    func updateTitle() -> Void {
        self.centerLabel?.text = centerTitle;
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
}

class WMBaseCircleView: UIView {
    
    private var outLayer:CAShapeLayer?
    private var progressLayer:CAShapeLayer?
    //linewidth
    var lineWidth:CGFloat = 4.0
    {
        didSet
        {
            updateLineWidth()
        }
    }
    //progress
    var progress:CGFloat = 0.0
    {
        didSet
        {
            guard (self.progressLayer != nil) else {
                return
            }
            updateProgress()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- add views
    func addViews() -> Void {
        
        
        self.outLayer = CAShapeLayer.init()
        outLayer?.strokeColor = UIColor.lightGray.cgColor
        outLayer?.lineWidth = lineWidth
        outLayer?.fillColor =  UIColor.clear.cgColor
        outLayer?.lineCap = kCALineCapRound
        self.layer.addSublayer(outLayer!)
        
        
        self.progressLayer = CAShapeLayer.init()
        progressLayer?.fillColor = UIColor.clear.cgColor
        progressLayer?.strokeColor = UIColor.blue.cgColor
        progressLayer?.lineWidth = lineWidth
        progressLayer?.lineCap = kCALineCapRound
        self.layer.addSublayer(progressLayer!)
        
      
        
        outLayer?.strokeEnd = 1.0
        progressLayer?.strokeEnd = 0.0
        
        


        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        outLayer?.path = layoutBezierPath().cgPath
        progressLayer?.path = layoutBezierPath().cgPath
    }
    
    func layoutBezierPath() -> UIBezierPath {
//        let rect = CGRect(x: lineWidth/2.0, y: lineWidth/2.0, width: self.frame.size.width-lineWidth, height: self.frame.size.height-lineWidth)
//        let path = UIBezierPath.init(ovalIn: rect)
        let TWO_M_PI:Double  = 2.0 * Double.pi
        let startAngle:Double = 0.75 * TWO_M_PI
        let endAngle:Double = startAngle + TWO_M_PI
        
        let width:CGFloat = self.frame.size.width
        
        let path = UIBezierPath.init(arcCenter: CGPoint(x: width/2.0, y: width/2.0), radius: width/2.0 - lineWidth, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)

        return path
    }

    func updateProgress() -> Void {
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn))
        CATransaction.setAnimationDuration(CFTimeInterval.init(1.0))
        self.progressLayer?.strokeEnd = progress
        CATransaction.commit()
        
    }

    func updateLineWidth() -> Void {
        self.outLayer?.lineWidth = lineWidth
        self.progressLayer?.lineWidth = lineWidth
    }

  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}





