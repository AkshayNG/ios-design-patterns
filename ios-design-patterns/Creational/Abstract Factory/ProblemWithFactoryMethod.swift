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

enum PackageType {
    case standardPackage, premiumPackage
}


//1. Room
enum BedType {
    case standardBed, premiumBed
}

struct Room {
    var packageType: PackageType
    var bedType: BedType
}

class RoomFactory {
    //create room based on package and bed type
    func createRoom(packageType: PackageType, bedType: BedType) -> Room {
        return Room.init(packageType: packageType, bedType: bedType)
    }
}


//2. Food
enum MealType {
    case standardMeal, premiumMeal
}

struct Food {
    var packageType: PackageType
    var mealType: MealType
}

class FoodFactory {
    //create room based on package and bed type
    func createFood(packageType: PackageType, mealType: MealType) -> Food {
        return Food.init(packageType: packageType, mealType: mealType)
    }
}

//Now that both the factories are ready, we can consume those as follows

let rf = RoomFactory()
let ff = FoodFactory()

//OK
let standardRoom = rf.createRoom(packageType: .standardPackage, bedType: .standardBed)
let premiumRoom = rf.createRoom(packageType: .premiumPackage, bedType: .premiumBed)
let standardFood = ff.createFood(packageType: .standardPackage, mealType: .standardMeal)
let premiumFood = ff.createFood(packageType: .premiumPackage, mealType: .premiumMeal)

//PROBLEM
//We are also allowed to create room with standard package and premium bed and vice versa
//Similarly, we can create food with standard package and premium meal and vice versa
let conflictStandardRoom = rf.createRoom(packageType: .standardPackage, bedType: .premiumBed)
let conflictPremiumRoom = rf.createRoom(packageType: .premiumPackage, bedType: .standardBed)
let conflictStandardFood = ff.createFood(packageType: .standardPackage, mealType: .premiumMeal)
let conflictPremiumFood = ff.createFood(packageType: .premiumPackage, mealType: .standardMeal)

//So, Apple store must provide iPhone with Apple charger, not with Samsung charger :)
