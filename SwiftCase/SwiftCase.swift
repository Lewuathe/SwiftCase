//
//  SwiftCase.swift
//  SwiftCase
//
//  Created by Sasaki Kai on 6/19/14.
//  Copyright (c) 2014 Sasaki Kai. All rights reserved.
//

import Foundation

/**
 *  Base class whose subclass implemented as case class
 *
 *  @param params [NSObject]
 */
class SwiftCase: NSObject {
    var _paramList: [NSObject] = [NSObject]()
    init(_ params: NSObject...) {
        for i in params {
            _paramList.append(i)
        }
    }
}

// Recursive matching
func internalMatching(ic1: SwiftCase, ic2: SwiftCase) -> Bool {
    var isOk = true
    
    // Match pattern object
    let matchArr = ic1._paramList
    // Matched object
    let originArr = ic2._paramList
    
    if matchArr.count == originArr.count {
        for var i = 0; i < matchArr.count; ++i {
            // Downcase as SwiftCase
            if let m = matchArr[i] as? SwiftCase {
                // In the case of SwiftCase, matching logic recursively
                if let o = originArr[i] as? SwiftCase {
                    isOk = internalMatching(m, o)
                    continue
                }
            }
            
            // Compare each constructor parameters
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

// Matching operator
func ~=(c1: SwiftCase, c2: SwiftCase) -> Bool {
    return internalMatching(c1, c2)
}

