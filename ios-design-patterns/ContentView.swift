//
//  ContentView.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var backgroundColor: Color?
    @State var textColor: Color?
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                Text("Hello, world!")
                    .foregroundColor(self.textColor)
                    .padding()
            }
            
        }.onAppear {
            //self.useSingleton()
            //self.usePrototype()
            //self.useBuilder()
            //self.useFactoryMethod()
            self.useAbstractFactory()
        }
    }
    
    func useSingleton(){
        Singleton.shared.set("Dark", forKey: "Theme")
        let theme = Singleton.shared.object(forKey: "Theme")
        print(theme ?? "No Theme")
    }
    
    func usePrototype() {
        let p1 = Prototype.init(x: 1, y: 2, shape: Shape.init(type: "Circle", size: 33))
        let p2 = p1.copy() as! Prototype
        p2.x = 3
        p2.y = 4
        p2.shape.type = "Square"
        p2.shape.size = 44
        print("p1: \(p1),\np2: \(p2)")
    }
    
    func useBuilder() {
        //1.
        var configuration = ["base_model": "budget"]
        var laptopBuilder = Builder.createLaptopBuilder(configuration: configuration)
        var director = Director(builder: laptopBuilder)
        director.constructLaptop(configuration: configuration)
        if let laptop = laptopBuilder?.getLaptop() {
            print(laptop)
        }

        //2
        configuration = ["base_model": "office",
                         "size": "13-inch"]
        laptopBuilder = Builder.createLaptopBuilder(configuration: configuration)
        director = Director(builder: laptopBuilder)
        director.constructLaptop(configuration: configuration)
        if let laptop = laptopBuilder?.getLaptop() {
            print(laptop)
        }

        //3
        configuration = ["base_model": "high-end",
                         "size": "13-inch",
                         "graphics": "intel-iris-plus-graphics-645"]
        laptopBuilder = Builder.createLaptopBuilder(configuration: configuration)
        director = Director(builder: laptopBuilder)
        director.constructLaptop(configuration: configuration)
        if let laptop = laptopBuilder?.getLaptop() {
            print(laptop)
        }
    }
    
    func useFactoryMethod() {
        let theme = FactoryMethod.makeTheme(profile: .dark)
        backgroundColor = theme.backgroundColor
        textColor = theme.textColor
    }
    
    func useAbstractFactory() {
        let standard = Package.createPackage(packageType: .standardPackage)
        print("STANDARD :: \(standard.room), \(standard.food)")
        let premium = Package.createPackage(packageType: .premiumPackage)
        print("PREMIUM :: \(premium.room), \(premium.food)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
