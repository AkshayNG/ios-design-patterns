//
//  Director.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 28/05/21.
//

public class Director {
    private var builder: LaptopBuilder?
    
    public init(builder: LaptopBuilder?) {
        self.builder = builder
    }
    
    public func constructLaptop(configuration: [String: String]) {
        builder?.buildParts(configuration: configuration)
    }
}
