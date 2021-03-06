//
//  Singleton.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 23/05/21.
//

/*
//TIP:
1. Use DispatchQueue to make singleton class thread-safe
2. Adhere to the Single Responsibility Principle
3. Avoid tight coupling
4. Singleton classes must not adopt the NSCopying protocol
*/

import Foundation

final public class Singleton {
    private var settings: [String: Any] = [:]
    
    public static let shared = Singleton()
    
    //private let serialQueue = DispatchQueue(label: "serialQueue")
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    private init() {}
    
    public func set(_ value: Any, forKey key: String) {
        //serialQueue.sync {
        concurrentQueue.async( flags: .barrier ) {
            self.settings[key] = value
        }
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
        //serialQueue.sync {
        concurrentQueue.sync {
            result = settings[key]
        }
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}
