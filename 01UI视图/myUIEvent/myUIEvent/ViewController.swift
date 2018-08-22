//
//  ViewController.swift
//  myUIEvent
//
//  Created by mac on 2018/8/22.
//  Copyright © 2018年 com.xinmem.editor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class myButton: UIButton {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !self.isUserInteractionEnabled ||
            self.isHidden ||
            self.alpha < 0.01 {
            return nil
        }
        if self.point(inside: point, with: event) {
            for view in self.subviews.reversed() {
                let p = convert(point, to: view)
                if let hitView = view.hitTest(p, with: event) {
                    return hitView
                }
            }
            return self
        }
        return nil
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let x1 = point.x
        let y1 = point.y
        
        let x2 = self.bounds.size.width / 2
        let y2 = self.bounds.size.height / 2
        let distance = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
        if distance < x2 {
            return true
        }
        return false
    }
}

