//
//  CheckInputs.swift
//  CloudIMTest
//
//  Created by Ian on 15/11/7.
//  Copyright © 2015年 AppCode. All rights reserved.
//

import Foundation

struct CheckInputs :OptionSetType {
    let rawValue :Int
    
    static let user = CheckInputs(rawValue: 1)
    static let pass = CheckInputs(rawValue: 1<<1)
    static let email = CheckInputs(rawValue: 1<<2)
}

extension CheckInputs {
    func isAllOk() -> Bool{
        let count = 3
        
        for time in 0..<count {
            if !self.contains(CheckInputs(rawValue: 1<<time)) {
                return false
            }
        }
        return true
    }
}
