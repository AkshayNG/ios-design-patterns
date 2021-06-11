//
//  PackageFactory.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 11/06/21.
//

import Foundation

protocol PackageFactory {
    var room: Room { get }
    var food: Food { get }
}

class Package {
        
    static func createPackage(packageType: PackageType) -> PackageFactory {
        switch packageType {
        case .standardPackage:
            return StandardPackage()
        case .premiumPackage:
            return PremiumPackage()
        }
    }
}

fileprivate class StandardPackage: PackageFactory {
    
    var room: Room {
        return Room.init(packageType: .standardPackage, bedType: .standardBed)
    }
    
    var food: Food {
        return Food.init(packageType: .standardPackage, mealType: .standardMeal)
    }
    
}

fileprivate class PremiumPackage: PackageFactory {
   
    var room: Room {
        return Room.init(packageType: .premiumPackage, bedType: .premiumBed)
    }
    
    var food: Food {
        return Food.init(packageType: .premiumPackage, mealType: .premiumMeal)
    }
    
}





