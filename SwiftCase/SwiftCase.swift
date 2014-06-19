//
//  SwiftCase.swift
//  SwiftCase
//
//  Created by Sasaki Kai on 6/19/14.
//  Copyright (c) 2014 Sasaki Kai. All rights reserved.
//

import Foundation

protocol SwiftCase {
    func unapply() -> Array<NSObject>
}

class SwiftPair {
    let first: SwiftCase
    let second: AnyObject
    init(first: SwiftCase, second: AnyObject) {
        self.first = first
        self.second = second
    }
}

@infix func ~> (source: SwiftCase, target: AnyObject)-> SwiftPair {
    return SwiftPair(first: source, second: target)
}

func match(c: SwiftCase)(arr: Array<SwiftPair>)-> AnyObject? {
    for pair in arr {
        let matchArr = (pair.first as SwiftCase).unapply()
        let originArr = c.unapply()
        var isOk = true
        if matchArr.count == originArr.count {
            for var i = 0; i < matchArr.count; ++i {
                if matchArr[i] != originArr[i] {
                    isOk = false
                }
            }
            if isOk {
                return pair.second
            }
        }
    }
    return nil
}


