//
//  ViewController.swift
//  WMcircleViewProgressViewtest
//
//  Created by apple on 2017/6/9.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var circleView:WMCircleProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.circleView = WMCircleProgressView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        circleView?.lineWidth = 10
        circleView?.centerLabel?.font = UIFont.systemFont(ofSize: 50);
        self.view.addSubview(circleView!)
        circleView?.center = self.view.center
        
        self.changed(slider);
        
     
    }
    
    
    @IBAction func changed(_ sender: Any) {
        let progress = (sender as! UISlider).value
        circleView?.progress = CGFloat(progress)
        circleView?.centerTitle = String.init(format: "%d%@", Int(progress * 100),"%")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

