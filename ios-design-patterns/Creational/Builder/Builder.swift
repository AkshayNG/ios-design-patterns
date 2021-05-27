//
//  Builder.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 28/05/21.
//

import Foundation

// Builder: separates creation of object from their config

class Builder {
    
    static func createLaptopBuilder(configuration: [String: String]) -> LaptopBuilder? {
        guard let model = configuration["base_model"] else {
            return nil
        }
            
        var laptopBuilder: LaptopBuilder?
        switch model {
        case "budget":
            laptopBuilder = BudgetLaptopBuilder()
        case "office":
            laptopBuilder = OfficeLaptopBuilder()
        case "high-end":
            laptopBuilder = HighEndLaptopBuilder()
        default:
            print("Unexpected value.")
        }
        
        return laptopBuilder
    }
}



