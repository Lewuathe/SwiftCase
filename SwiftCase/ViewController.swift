//
//  ViewController.swift
//  SwiftCase
//
//  Created by Sasaki Kai on 6/19/14.
//  Copyright (c) 2014 Sasaki Kai. All rights reserved.
//

import UIKit

class User: SwiftCase {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func unapply() -> Array<NSObject> {
        return [self.name, self.age]
    }
}

class OtherUser: SwiftCase {
    let name: String
    let age: Int
    let address: String
    init(name: String, age: Int, address: String) {
        self.name = name
        self.age = age
        self.address = address
    }
    
    func unapply() -> Array<NSObject> {
        return [self.name, self.age, self.address]
    }
}

func myadd(v1: Int, v2: Int)-> Int {
    return v1 + v2
}

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ans = myadd(1, 2)
        let user = User(name: "NOBITA", age: 34)
        let ret : AnyObject? = match(user)(arr: [
            User(name: "TAKESHI", age: 23) ~> 1,
            User(name: "NOBITA", age: 32) ~> 2,
            User(name: "NOBITA", age: 34) ~> 3,
            OtherUser(name: "NOBITA", age: 20, address: "TOKYO") ~> 4
        ])
        
        if ret {
            print(ret)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

