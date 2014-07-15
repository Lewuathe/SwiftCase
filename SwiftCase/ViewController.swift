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
        super.init(name, age)
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
        super.init(name, age, address)
    }
}

class TwoUsers: SwiftCase {
    let user1: User
    let user2: User
    init(user1: User, user2: User) {
        self.user1 = user1
        self.user2 = user2
        super.init(user1, user2)
    }
}

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let user1 = User(name: "NOBITA", age: 12)
        let user2 = User(name: "TAKESHI", age: 13)

        let twoUsers = TwoUsers(user1: user1, user2: user2)
        
        switch twoUsers {
            case User(name: "NOBITA", age: 12):
            println("He is NOBITA")
            case User(name: "TAKESHI", age: 13):
            println("He is TAKESHI")
            case User(name: "NOBITANIAN", age: 14):
            println("He is old NOBITA ")
			case OtherUser(name: "NOBITA", age: 12, address: "TOKYO"):
			println("He is other man")
            case TwoUsers(user1: User(name: "NOBITA", age: 12), user2: User(name: "TAKESHI", age: 13)):
            println("They are NOBITA and TAKESHI")
            default:
			println("Who is he?")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

