//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        var view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        objc_setAssociatedObject(self, &view, "sssss", objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        let obj = myObj()
        let value = obj.value(forKey: "isKey")
    }
}

class myObj: NSObject {
    var key = 10
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
