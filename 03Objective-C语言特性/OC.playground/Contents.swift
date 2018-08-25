//: A UIKit based Playground for presenting user interface

import UIKit
//import PlaygroundSupport

//class MyViewController : UIViewController {
//    override func loadView() {
//        var view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//        objc_setAssociatedObject(self, &view, "sssss", objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
//        let obj = myObj()
//        let value = obj.value(forKey: "isKey")
//    }
//}
//
//class myObj: NSObject {
//    var key = 10
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

class User: NSObject {
    
    // KVO-enabled properties must be @objc dynamic
    @objc dynamic var name: String
    init(name: String) {
        self.name = name
    }
}

class MyObj: NSObject {
    @objc dynamic var sex: String
    init(sex: String) {
        self.sex = sex
    }
}

class UserStore: NSObject {
    static let shared = UserStore()
    @objc dynamic var isLogin = false
}

extension User {
    override var description: String {
        return "name: \(name)"
    }
}


/// 这段截取自 《Swift 进阶》
extension NSObjectProtocol where Self: NSObject {
    func observe<A, Other>(_ keyPath: KeyPath<Self, A>, writeTo other: Other, _ otherKeyPath: ReferenceWritableKeyPath<Other, A>)
        -> NSKeyValueObservation where A: Equatable, Other: NSObjectProtocol
    {
        return observe(keyPath, options: .new) { (_, change) in
            guard let newValue = change.newValue, other[keyPath: otherKeyPath] != newValue else { return }
            other[keyPath: otherKeyPath] = newValue
        }
        
    }
    func bind<A, Other>(_ keyPath: ReferenceWritableKeyPath<Self,A>,to other: Other,_ otherKeyPath: ReferenceWritableKeyPath<Other,A>)
        -> (NSKeyValueObservation, NSKeyValueObservation) where A: Equatable, Other: NSObject
    {
        let one = observe(keyPath, writeTo: other, otherKeyPath)
        let two = other.observe(otherKeyPath, writeTo: self, keyPath)
        return (one,two)
    }
}

// 单选绑定
//var user = User(name: "Gua Li")
//var newUser = User(name: "name")
//let observation = user.observe(\User.name, writeTo: newUser, \User.newName)
//
//user.name = "good"
//print(user.name)
//print(newUser.newName)

// 双向绑定
//var user = User(name: "Gua Li")
//var newUser = MyObj(sex: "name")
//let observation = user.bind(\User.name, to: newUser, \MyObj.sex)
//
//user.name = "good"
//print(user.name)
//print(newUser.sex)
//
//newUser.sex = "ssssss"
//print(user.name)
//print(newUser.sex)

// 绑定登录状态
_ = UserStore.shared.observe(\UserStore.isLogin, options: [.new,.old]) { (user, change) in
    if let newValue = change.newValue {
        print("new is \(newValue)")
    }
    
    if let old = change.oldValue {
        print("old is \(old)")
    }
    // 登录操作
    
    
}

UserStore.shared.isLogin = true
UserStore.shared.isLogin = false


