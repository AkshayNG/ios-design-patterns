//
//  LaptopBuilder.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 28/05/21.
//

import Foundation

public protocol LaptopBuilder {
    var size: Size {get set}
    var processor: Processor {get set}
    var graphics: Graphics {get set}
    
    mutating func buildParts(configuration: [String: String])
    func getLaptop() -> Laptop
}

extension LaptopBuilder {
    mutating public func buildParts(configuration: [String: String]) {
        if let customSize = configuration["size"] {
            switch customSize {
            case "13-inch":
                size = Size.thirteenInch
            case "15-inch":
                size = Size.fifteenInch
            default:
                print("Invalid value")
            }
        }
        
        if let customProcessor = configuration["processor"] {
            switch customProcessor {
            case "i5":
                processor = Processor.i5
            case "i7":
                processor = Processor.i7
            case "i9":
                processor = Processor.i9
            default:
                print("Invalid value")
            }
        }
        
        if let customGraphics = configuration["graphics"] {
            switch customGraphics {
            case "intel-uhd-graphics-617":
                graphics = Graphics.intelUHD617
            case "intel-iris-plus-graphics-645":
                graphics = Graphics.intelIrisPlus645
            case "radeon-pro-vega-20":
                graphics = Graphics.radeonProVega20
            default:
                print("Invalid value")
            }
        }
    }
    
    public func getLaptop() -> Laptop {
        return Laptop(size: size, processor: processor, graphics: graphics)
    }
}

public class BudgetLaptopBuilder: LaptopBuilder {
    public var size = Size.thirteenInch
    public var processor = Processor.i5
    public var graphics = Graphics.intelUHD617
    public init() {}
}

public class OfficeLaptopBuilder: LaptopBuilder {
    public var size = Size.fifteenInch
    public var processor = Processor.i7
    public var graphics = Graphics.intelIrisPlus645
    public init() {}
}

public class HighEndLaptopBuilder: LaptopBuilder {
    public var size = Size.fifteenInch
    public var processor = Processor.i9
    public var graphics = Graphics.radeonProVega20
    public init() {}
}
