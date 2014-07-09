//
//  SwiftCase.swift
//  SwiftCase
//
//  Created by Sasaki Kai on 6/19/14.
//  Copyright (c) 2014 Sasaki Kai. All rights reserved.
//

import Foundation

class SwiftCase: NSObject {
    var _paramList: [NSObject] = [NSObject]()
    init(_ params: NSObject...) {
        for i in params {
            _paramList.append(i)
        }
    }
}

func internalMatching(ic1: SwiftCase, ic2: SwiftCase) -> Bool {
    var isOk = true
    let matchArr = ic1._paramList
    let originArr = ic2._paramList
    if matchArr.count == originArr.count {
        for var i = 0; i < matchArr.count; ++i {
            if let m = matchArr[i] as? SwiftCase {
                if let o = originArr[i] as? SwiftCase {
                    isOk = internalMatching(m, o)
                    continue
                }
            }
            
            if matchArr[i] != originArr[i] {
                isOk = false
            }
        }
        if isOk {
            return true
        }
    }
    return false
}

func ~=(c1: SwiftCase, c2: SwiftCase) -> Bool {
    return internalMatching(c1, c2)
}

