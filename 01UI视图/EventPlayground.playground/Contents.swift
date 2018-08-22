//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        view.addSubview(backButton)
        view.addSubview(contentView)
        contentView.addSubview(button1)
        contentView.addSubview(button2)

        self.view = view
    }
    
    lazy var button1: myButton = {
        let label = myButton()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.backgroundColor = UIColor.red
//        label.addTarget(self, action: #selector(MyViewController.myAction(sender:)), for: .touchUpInside)
        return label
    }()
    
    lazy var button2: myButton = {
        let label = myButton()
        label.frame = CGRect(x: 200, y: 0, width: 100, height: 100)
        label.backgroundColor = UIColor.blue
//        label.addTarget(self, action: #selector(MyViewController.myAction2(sender:)), for: .touchUpInside)
        label.isUserInteractionEnabled = false
        return label
    }()
    
    lazy var backButton: myContentView = {
        let label = myContentView()
        label.frame = CGRect(x: 0, y: 100, width: 400, height: 200)
        label.backgroundColor = UIColor.black
        //        label.addTarget(self, action: #selector(MyViewController.myAction2(sender:)), for: .touchUpInside)
        return label
    }()
    
    lazy var contentView: myContentView = {
        let label = myContentView()
        label.frame = CGRect(x: 0, y: 100, width: 300, height: 200)
        label.backgroundColor = UIColor.gray
        //        label.addTarget(self, action: #selector(MyViewController.myAction2(sender:)), for: .touchUpInside)
        return label
    }()
    
    @objc func myAction(sender: UIButton) {
        print("action")
    }
    
    @objc func myAction2(sender: UIButton) {
        print("action2")
    }

}

class myContentView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        // 自身事件穿透,其他子控件响应事件
//        if hitView == self {
//            return nil
//        } else {
//            return hitView
//        }
        return hitView
    }
}

class myButton: UIView {
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
//        print(self.frame)
       
        //扩大点击范围到视图的外面
        //[hit使用场景](https://www.jianshu.com/p/ce2c792902d3)
        let rect = self.frame.insetBy(dx: -20, dy: -20)
        return rect.contains(point)
        
        // 指定点击范围为圆形
//        let x1 = point.x
//        let y1 = point.y
//
//        let x2 = self.bounds.size.width / 2
//        let y2 = self.bounds.size.height / 2
//        let distance = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
//        if distance < x2 {
//            return true
//        }
//        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch is %@", self)
//        super.touchesBegan(touches, with: event)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
