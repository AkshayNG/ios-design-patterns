//
//  ProblemWithFactory.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 08/06/21.
//

import Foundation

//The example here in this file illustrate the problem with Factory Method
//Ref: https://youtu.be/IglWExgxA-U
// There is a Room and Food Package, standard room must recieve standard package and premium room must recieve premium package

enum Package {
    case standardPackage, premiumPackage
}

//1. Room
enum BedType {
    case standardBed, premiumBed
}

struct Room {
    var package: Package
    var bedType: BedType
}

class RoomFactory {
    //create room based on package and bed type
    func createRoom(package: Package, bedType: BedType) -> Room {
        return Room.init(package: package, bedType: bedType)
    }
}


//2. Food
enum MealOption {
    case standardMeal, premiumMeal
}

struct Food {
    var package: Package
    var meal: MealOption
}

class FoodFactory {
    //create room based on package and bed type
    func createFood(package: Package, mealOption: MealOption) -> Food {
        return Food.init(package: package, meal: mealOption)
    }
}

//Now that both the factories are ready, we can consume those as follows

let rf = RoomFactory()
let ff = FoodFactory()

//OK
let standardRoom = rf.createRoom(package: .standardPackage, bedType: .standardBed)
let premiumRoom = rf.createRoom(package: .premiumPackage, bedType: .premiumBed)
let standardFood = ff.createFood(package: .standardPackage, mealOption: .standardMeal)
let premiumFood = ff.createFood(package: .premiumPackage, mealOption: .premiumMeal)

//PROBLEM
//We are allowed to create room with standard package and premium bed and vice versa
//Similarly, we can create food with standard package and premium meal and vice versa
let conflictStandardRoom = rf.createRoom(package: .standardPackage, bedType: .premiumBed)
let conflictPremiumRoom = rf.createRoom(package: .premiumPackage, bedType: .standardBed)
let conflictStandardFood = ff.createFood(package: .standardPackage, mealOption: .premiumMeal)
let conflictPremiumFood = ff.createFood(package: .premiumPackage, mealOption: .standardMeal)

//So, Apple store must provide iPhone with Apple charger, not with Samsung charger :)
