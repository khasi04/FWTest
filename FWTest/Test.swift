//
//  Test.swift
//  FWTest
//

import Foundation

@objc public class Test: NSObject {
    @objc public static let sharedInstance = Test()
    
    @objc public func hello() -> String {
        return "hello"
    }
}

