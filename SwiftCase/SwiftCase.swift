//
//  SwiftCase.swift
//  SwiftCase
//
//  Created by Sasaki Kai on 6/19/14.
//  Copyright (c) 2014 Sasaki Kai. All rights reserved.
//

import Foundation

@objc protocol SwiftCase {
    func unapply() -> Array<NSObject>
}

class SwiftCasePair {
    let first: SwiftCase
    let second: AnyObject
    init(first: SwiftCase, second: AnyObject) {
        self.first = first
        self.second = second
    }
}

@infix func ~> (source: SwiftCase, target: AnyObject)-> SwiftCasePair {
    return SwiftCasePair(first: source, second: target)
}


func match(c: SwiftCase)(cases: Array<SwiftCasePair>)-> AnyObject? {
    func recursiveMatch(matchArr: Array<NSObject>, originArr: Array<NSObject>) -> Bool {
        var isOk = true
        if matchArr.count == originArr.count {
            for var i = 0; i < matchArr.count; ++i {
                if matchArr[i] is SwiftCase && originArr[i] is SwiftCase {
                    let m = matchArr[i] as SwiftCase
                    let o = originArr[i] as SwiftCase
                    isOk = recursiveMatch(m.unapply(), o.unapply())
                } else if matchArr[i] != originArr[i] {
                    isOk = false
                    break
                }
            }
        } else {
            isOk = false
        }
        return isOk
    }

    for pair in cases {
        let matchArr = (pair.first as SwiftCase).unapply()
        let originArr = c.unapply()
        let isOk = recursiveMatch(matchArr, originArr)
        if isOk {
            return pair.second
        }
    }
    return nil
}




