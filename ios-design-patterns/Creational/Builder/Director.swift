//
//  Director.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 28/05/21.
//

/*
Without the Director every client would have the need to know EXACTLY how the building works.
But with the Director all the Client needs to know is what Builder to use in a specific case.
In the builder you can change how a part is build.
In the director you can change how to assemble the parts.
*/

public class Director {
    private var builder: LaptopBuilder?
    
    public init(builder: LaptopBuilder?) {
        self.builder = builder
    }
    
    public func constructLaptop(configuration: [String: String]) {
        builder?.buildParts(configuration: configuration)
    }
}
