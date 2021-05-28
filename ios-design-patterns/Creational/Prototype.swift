//
//  Prototype.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 24/05/21.
//

import Foundation

class Prototype {
    
    var x: Int!
    var y: Int!
    var shape: Shape
    
    init(x: Int, y: Int, shape: Shape) {
        self.x = x
        self.y = y
        self.shape = shape
    }
}

extension Prototype: CustomStringConvertible {
    var description: String {
        return "Point (\(String(x)), \(String(y)), \(shape))"
    }
}

extension Prototype: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Prototype.init(x: self.x, y: self.y, shape: self.shape.copy() as! Shape)
    }
}

class Shape {
    var type: String
    var size: Int
    
    init(type: String, size: Int) {
        self.type = type
        self.size = size
    }
}

extension Shape: CustomStringConvertible {
    var description: String {
        return "type = \(type), size = \(String(size))"
    }
}

// For Deep Copying, Shallow copy otherwise
extension Shape: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Shape.init(type: type, size: size)
    }
}


