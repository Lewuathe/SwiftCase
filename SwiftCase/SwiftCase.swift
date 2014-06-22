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

struct SwiftPair<T> {
    let first: SwiftCase
    let second: T
    init(first: SwiftCase, second: T) {
        self.first = first
        self.second = second
    }
}

@infix func ~> <T>(source: SwiftCase, target: T)-> SwiftPair<T> {
    return SwiftPair(first: source, second: target)
}

func match<T>(c: SwiftCase)(cases: Array<SwiftPair<T>>)-> T? {
    for pair in cases {
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



