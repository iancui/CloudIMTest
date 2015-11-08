//: Playground - noun: a place where people can play

import Cocoa


var str = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,30}"


let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// 输出 "ACCESS DENIED"

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
            if self.contains(CheckInputs(rawValue: 1<<time)) {
                return false
            }
        }
        return true
    }
}
