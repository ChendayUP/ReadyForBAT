//
//  ViewController.swift
//  GCD
//
//  Created by mac on 2018/8/28.
//  Copyright © 2018年 com.xinmem.editor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       imageUpload()
    }
    
    func imageUpload() {
        var array = [Any]()
        for i in 0...5 {
            array.append("\(i)")
        }
        
        func uplaodAPI(idx: Int, url: String) {
            // 异步线程 转换成同步线程
            let queue = DispatchQueue(label: "com.flion.dispatchgroup", attributes: .concurrent)
            let sema = DispatchSemaphore(value: 0)
            queue.async {
                print("url upload is \(url) begin")
                sleep(arc4random_uniform(5))
//                if idx != 3 {
                    array[idx] = Int(url)!
//                }
                sema.signal()
            }
            sema.wait()
            print("url upload is \(url)       end")
        }
        
        func upload(_ num: Int) {
            if num < 0 {
                print("上传失败")
                return
            }
            print(num)
//            print("currentThread---\(Thread.current)")
            // 打印当前线程
//            print("asyncConcurrent---begin")
            let queue = DispatchQueue(label: "com.flion.dispatchgroup", attributes: .concurrent)
            let group = DispatchGroup()
            
            for (idx, url) in array.enumerated() {
                if url is String {
                    queue.async(group: group, execute: {() -> Void in
                        uplaodAPI(idx: idx, url: url as! String)
                    })
                }
            }
            group.notify(queue: DispatchQueue.main) {
                
                let count = array.filter({ (value) -> Bool in
                    return value is String
                })
                if count.count > 0 {
                    upload(num - 1)
                } else {
                    print("done doing all stuff")
                }
            }
        }
        
        upload(1)
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

