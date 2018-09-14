//: Playground - noun: a place where people can play

import UIKit

print("currentThread---\(Thread.current)")
// 打印当前线程
print("asyncConcurrent---begin")
let queue = DispatchQueue(label: "com.flion.dispatchgroup", attributes: .concurrent)
var group = DispatchGroup()

var array = [String]()
for i in 0...5 {
    array.append("\(i)")
}

for url in array {
    
    queue.async(group: group, execute: {() -> Void in
        print("url is \(url)")
    })
}
group.notify(queue: DispatchQueue.main) {
    print("done doing all stuff")
}

print("done")
