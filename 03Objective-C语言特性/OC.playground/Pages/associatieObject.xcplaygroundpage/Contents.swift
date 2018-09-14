//: [Previous](@previous)

import Foundation

private var key = "new"
class myObject: NSObject {
//    class var key = "ssss"
    
    func setup() -> Void {
        objc_setAssociatedObject(self,
                                 &key, "ssdfsdfs",
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

let my = myObject()
my.setup()
